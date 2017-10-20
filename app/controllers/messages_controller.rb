class MessagesController < ApplicationController
	def index
		@messages = Message.joins(:user).select('messages.*, users.first_name, users.last_name').where(:messages => {:receiver_id => session[:id_current_user]}).order(created_at: :desc)
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
end
