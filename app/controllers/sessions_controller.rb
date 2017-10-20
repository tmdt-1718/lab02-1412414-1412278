class SessionsController < ApplicationController
	layout "login_layout"

	before_action :authenticate, only: [:new]

	def new
	end

	def create
		if params[:session].present?
			user = User.find_by(session_email_params)
		
			if user.nil?
				flash[:login_error] = "Wrong email!!!"

				render :new
			else 
				if user.authenticate(session_password_params)	
				    session[:first_name_current_user] = user["first_name"];
					session[:last_name_current_user] = user["last_name"];
					session[:id_current_user] = user["id"];

					redirect_to messages_path
				else
					flash[:login_error] = "Wrong password!!!"

					render :new
				end
			end		
		else
			begin
				user = User.from_omniauth(request.env['omniauth.auth'])

				session[:first_name_current_user] = user["first_name"];
				session[:last_name_current_user] = user["last_name"];
				session[:id_current_user] = user["id"];
			rescue
				flash[:login_error] = "Failed!!!"

				render :new
			end

			redirect_to messages_path
		end
	end

	def destroy
		session.delete(:first_name_current_user)
		session.delete(:last_name_current_user)
		session.delete(:id_current_user)

		redirect_to login_path
	end

	def failure
		render :new
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
		if session[:id_current_user] && session[:first_name_current_user] && session[:last_name_current_user]
			redirect_to messages_path
		end
	end
end
