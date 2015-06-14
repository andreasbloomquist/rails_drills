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
		login(@user)
		redirect_to @user
	end

	def show
		@user = User.find(params[:id])
		render :show
	end

	def log_out
		logout
		redirect_to login_path
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
