class FriendController < ApplicationController
  def show
    @friendlist = Friend.joins('Left join users on users.id = friends.friend_id').select('friends.friend_id, users.first_name,users.last_name').where(:friends => {:user_id => session[:id_current_user]})
  end

  def new
    @list = User.all
     @friendlist = Friend.joins('Left join users on users.id = friends.friend_id').select('friends.friend_id, users.first_name,users.last_name,users.email').where(:friends => {:user_id => session[:id_current_user]})
  end

  def create
    @friend = Friend.new(:user_id =>session[:id_current_user],:friend_id => params[:user_id] )
    @friend2 = Friend.new(:user_id =>params[:user_id],:friend_id => session[:id_current_user] )


    if @friend.save && @friend2.save
      render json: nil
    else
    render json: "There has been an error occured"
    end
  end

  private
  def friend_param
    params.require(:friend).permit(:user_id,:friend_id)
  end

end
