class MessagesController < ApplicationController
	before_action :authenticate, only: [:new, :index]

	def index
		@messages = Message.joins(:user).select('messages.*, users.first_name, users.last_name').where(:messages => {:receiver_id => session[:id_current_user]}).paginate(page: params[:page], per_page: 10).order(created_at: :desc)

		respond_to do |format|
		  format.html
		  format.js
		end
	end

	def new
	end

	def create
	end

	def edit
		result = Message.where(id: params["id"]).update_all(status: 1)

		if result == 1
			render json: nil
		else 
			render json: "There has been an error occured"
		end
	end

	def authenticate
		if session[:id_current_user].nil? && session[:first_name_current_user].nil? && session[:last_name_current_user].nil?
			redirect_to login_path
		end
	end
end
