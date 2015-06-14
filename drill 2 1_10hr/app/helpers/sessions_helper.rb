module SessionsHelper

	def login(user)
		session[:user_id] = user.id
	end

	def current_user
		if session[:user_id] == nil
			return false
		else
			@current_user ||= User.find(session[:user_id])
		end
	end

	def logged_in?
		if current_user == nil
			redirect_to login_path
		end
	end

	def logout
		@current_user = session[:user_id] = nil
	end
end
