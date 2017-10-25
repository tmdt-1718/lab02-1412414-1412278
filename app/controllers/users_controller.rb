class UsersController < ApplicationController
	layout "signup_layout"

	before_action :authenticate, only: [:new]

	def new
	end


	def create
		user = User.find_by(user_email_params)

		if user.nil?
			@user = User.new(user_params)

			max_id = User.maximum("id");
			max_id += 1

			@user["id"] = max_id
			@user.password = user_password_params;

			if @user.save
				redirect_to login_path
			else
				flash[:signup_error] = "Cannot sign up user"
				render :new
			end
		else
			flash[:signup_error] = "Email has existed!!!"
			render :new
		end
	end

	private
	def user_email_params
		params.require(:user).permit(:email)
	end

	private
	def user_password_params
		params.require(:user).permit(:password)
	end

	private
	def user_params
		params.require(:user).permit(:email, :last_name, :first_name, :phone_number, :password)
	end

	def authenticate
		if session[:id_current_user] && session[:first_name_current_user] && session[:last_name_current_user]
			redirect_to messages_path
		end
	end
end
