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
			flash[:notice] = "Sign in successful!"
			redirect_to "/users/#{@user.id}"
		else
			flash[:error] = "Hmm, either your email or password wasn't correct, try again"
			redirect_to login_path
		end
	end

end
