class User < ApplicationRecord

  #Limitation of requests per day for a user
  has_many :requests , dependent: :destroy

  #Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :ensure_authentication_token_is_present


  #validations 
  validates :first_name, :last_name, :username, :email, presence: true
  validates :email, uniqueness: true

  # Assosiations
  has_many :tweets , through: :rooms
  has_many :fulfillments
  #validates :fulfillments, length: {maximum: 1}



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
