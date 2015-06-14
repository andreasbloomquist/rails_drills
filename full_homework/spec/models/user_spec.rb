require 'rails_helper'

describe User, type: :model do

	context "validation" do 
		let(:user) do
			User.new({
				email: "taco@pup.com",
				password: "test",
				password_confirmation: "test"
				})
		end
		it "validates presence of email" do
			user.email = nil
			expect(user).not_to be_valid
		end

		it "validates uniqueness of email" do
			user1 = User.create({
				email: "taco@pup.com",
				password: "test",
				password_confirmation: "test"
				})
			user2 = User.create({
				email: "taco@pup.com",
				password: "test",
				password_confirmation: "test"				
				})
			expect(user2).not_to be_valid
		end
	end
	
	context "Account creation" do
		let(:user) { User.new }

		it "Allows for setting of password" do
			expect(user).to respond_to(:password=).with(1).argument
		end

		it "creates password digest when password is set" do
			expect(user.password_digest).to be_nil
			user.password = "sometest"
			expect(user.password_digest).not_to be_nil
		end
	end

	context 'Authentication' do
		before(:all) do
			@user = User.create({
				email: "taco@cat.com",
				password: "test1",
				password_confirmation: "test1"
				})
		end

		describe "#authenticate" do
			it 'returns user when password is correct' do
				expect(@user.authenticate("test1")).to eq(@user)
			end

			it "returns false when the password is incorrect" do
				expect(@user.authenticate("badpass")).to eq(false)
			end
		end

		describe "::confirm" do
			it "checks to see if a specified email / password exists" do
				user_email = "taco@cat.com"
				password = "test1"
				found_user = User.find_by(email: user_email)
				expect(User.confirm(user_email, password)).to eq(found_user.authenticate(password))
			end
		end
	end
end