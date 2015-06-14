class User < ActiveRecord::Base
	has_many :articles

	validates_presence_of :email, :password, :password_confirmation
	validates_uniqueness_of :email
	
	BCrypt::Engine.cost = 10

	has_secure_password

	def self.confirm(email, password)
		user = User.find_by(email: email)
		user.try(:authenticate, password)
	end
end
