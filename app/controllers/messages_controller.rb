class MessagesController < ApplicationController
	def index
		@messages = Message.joins(:user).select('messages.*, users.*').where(:messages => {:receiver_id => session[:id_current_user]}).order(created_at: :desc)
	end

	def new
	end

	def create
	end
end
