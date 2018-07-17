class User < ApplicationRecord
	has_secure_password
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :email, :presence => true

	def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end
end
