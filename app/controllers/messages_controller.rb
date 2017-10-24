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
		@friends = Friend.joins("left join users on friends.friend_id = users.id").select('friends.user_id, friends.friend_id, users.first_name, users.last_name').where(:friends => {:user_id => session[:id_current_user]})
	end

	def create
		message = Message.new

		max_id = Message.maximum("id")
		max_id += 1

		message.id = max_id
		message.receiver_id = params[:message][:receiver_id].to_i
		message.content = params[:message][:content]
		message.user_id = session["id_current_user"]
		message.status = 0;

		begin
			message.save!

			flash[:success_create_message] = "Sent successfully to #{params[:message][:receiver_id].to_i}!!!"
			redirect_to messages_path
		rescue Exception => ex
			flash[:error_create_message] = "An error of type #{ex.class} happened, message is #{ex.message}"
			redirect_to messages_path
		end
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
