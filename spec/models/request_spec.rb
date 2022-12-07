require 'rails_helper'

RSpec.describe Request, type: :model do
    current_user = User.first_or_create!(
        email: "test@gmail.com", 
        password :"12345678",
        password_confirmation: "12345678", 
        first_name: "test", 
        last_name: "test")
    it 'creating request' do
        request = Request.create(
            user: current_user, 
            description: "test")
        expect(request).to be_valid
    end
end