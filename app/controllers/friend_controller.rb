class FriendController < ApplicationController
  def show
    @friendlist = Friend.joins('Left Join users on users.id = friends.friend_id').select('users.first_name,users.last_name').where(:friends => {:user_id => session[:id_current_user]})
  end

  def new
      @list = User.all
     @friendlist = Friend.joins('Left Join users on users.id = friends.friend_id').select('users.id, users.first_name,users.last_name,users.email').where(:friends => {:user_id => session[:id_current_user]})
  end

  def create
  error = 0

  begin
    receivers.each do |id|
      friend = Friend.new

      friend.user_id = session["id_current_user"]
      friend.friend_id = params[:friend_id]



      begin
        friend.save!
      rescue Exception => ex
        error += 1
        flash[:error_create_relationship] = "An error of type #{ex.class} happened, relationship is #{ex.message}"
      end
    end
  rescue Exception => ex
    error += 1
    flash[:error_create_relationship] = "An error of type #{ex.class} happened, relationship is #{ex.message}"
  end

  if error == 0
    flash[:success_create_relationship] = "Creat successfully!!!"
  end

  redirect_to friend_path
end

  

end
