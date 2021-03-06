class SessionsController < ApplicationController

	def new
		@user = User.new
		render :new
	end

	def create
		user_params = params.require(:user).permit(:email, :password)
		@user = User.confirm(user_params[:email], user_params[:password])
		if @user
			login(@user)
			redirect_to "/users/#{@user.id}"
		else
			redirect_to login_path
		end
	end

end
