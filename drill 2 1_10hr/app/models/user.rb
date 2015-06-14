class User < ActiveRecord::Base
	BCrypt::Engine.cost = 10

	validates_presence_of :email
	validates_uniqueness_of :email

	has_secure_password

	has_many :articles

	def self.confirm(email, password)
		user = User.find_by(email: email)
		user.try(:authenticate, password)
	end
end
