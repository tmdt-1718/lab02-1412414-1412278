class SessionsController < ApplicationController
	layout "login_layout"

	before_action :authenticate, only: [:new]

	def new
	end

	def create
		@user = User.find_by(session_email_params)

		if @user.nil?
			flash[:login_error] = "Wrong email!!!"
			render :new
		else 
			if @user.password == session_password_params
		    	session[:firstname_current_user] = @user["firstname"];
				session[:lastname_current_user] = @user["lastname"];
				session[:id_current_user] = @user["id"];
				redirect_to messages_path
		  	else
		    	flash[:login_error] = "Wrong password!!!"
				render :new
		  	end
		end		
	end

	def destroy
		session.delete(:firstname_current_user)
		session.delete(:lastname_current_user)
		session.delete(:id_current_user)

		redirect_to login_path
	end

	private
	def session_email_params
		params.require(:session).permit(:email)
	end

	private
	def session_password_params
		params.require(:session).permit(:password)
	end

	def authenticate
		if session[:id_current_user] && session[:firstname_current_user] && session[:lastname_current_user]
			redirect_to messages_path
		end
	end
end
