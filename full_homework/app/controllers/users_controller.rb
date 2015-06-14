class UsersController < ApplicationController

	def index
		users = User.all
		render :index
	end

	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.create(user_params)
		if @user.errors.messages == {}
			login(@user)
			flash[:notice] = "Sign up successful!"
			redirect_to @user
		else 
			flash[:error] = "Something went wrong, please try again"
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
		render :show
	end

	def log_out
		logout
		flash[:notice] = "Logged out successfully!"
		redirect_to login_path
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
