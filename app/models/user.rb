class User < ApplicationRecord
  LIMIT = 2

  #Limitation of requests per day for a user
  has_many :requests , dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :fulfillments, dependent: :destroy

  #has one fulfillment per request
  def has_fulfilled?(request)
    fulfillments.where(request_id: request.id).any?
  end


  #Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :ensure_authentication_token_is_present


  #validations 
  validates :first_name, :last_name, :username, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  #maximum users that can fulfill a request
  def max_users 
    if self.users.count >= 2
      errors.add(:base, "Exceeds weekly limit")
    end 
  end

  
  #limit the number of users that can fulfill a request
  # def limit_of_fulfillments
  #   if self.fulfillments.count >= Fulfillment::LIMIT
  #     errors.add(:base, "You can't fulfill this request")
  #   end
  # end
  

  def name
    [first_name, last_name].join(" ").strip
  end

  def super_admin?
    role == "super_admin"
  end

  def as_json(options = {})
    new_options = options.merge(only: [:email, :first_name, :last_name, :username, :current_sign_in_at])

    super new_options
  end

  private

    def send_devise_notification(notification, *args)
      devise_mailer.send(notification, self, *args).deliver_later(queue: "devise_email")
    end

    def ensure_authentication_token_is_present
      if authentication_token.blank?
        self.authentication_token = generate_authentication_token
      end
    end

    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end
end
