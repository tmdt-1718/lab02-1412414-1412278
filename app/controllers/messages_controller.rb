class MessagesController < ApplicationController
	before_action :authenticate, only: [:new, :index]

	def index
			@messages = Message.joins(:user).select('messages.*, users.first_name, users.last_name').where(:messages => {:receiver_id => session[:id_current_user]}).paginate(page: params[:page], per_page: 10).order(created_at: :desc)

		respond_to do |format|
		  format.html
		  format.js
		end
	end
	def sent
		@messages = Message.joins('Left join users on users.id = messages.receiver_id').select('messages.*, users.first_name, users.last_name').where(:messages => {:user_id => session[:id_current_user]}).order(updated_at: :desc)


			end
	def new
		@messages = Message.joins(:user).select('messages.*, users.first_name, users.last_name').where(:messages => {:receiver_id => session[:id_current_user]}).order(created_at: :desc)
			end

	def create
		error = 0

		begin
			receivers = params[:message][:ids]

			receivers.each do |receiver|
				message = Message.new(message_params)

				max_id = Message.maximum("id")
				max_id += 1

				message.id = max_id
				message.receiver_id = receiver
				message.user_id = session["id_current_user"]
				message.status = 0;

				begin
					message.save!
				rescue Exception => ex
					error += 1
					flash[:error_create_message] = "An error of type #{ex.class} happened, message is #{ex.message}, #{receivers}"
				end
			end
		rescue Exception => ex
			error += 1
			flash[:error_create_message] = "An error of type #{ex.class} happened, message is #{ex.message}, #{receivers}"
		end

		if error == 0
			flash[:success_create_message] = "Sent successfully!!!, #{receivers}"
		end

		redirect_to messages_path
	end

	def message_params
		params.require(:message).permit(:image, :content)
	end

	def edit
		result = Message.where(id: params["id"]).update_all(status: 1,updated_at: Time.current)

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
