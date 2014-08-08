class FriendshipsController < ApplicationController

  # This action added a new record in friendships table
  def create
    @friendship = current_user.friendships.new(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Friend successfully added"
      redirect_to users_url
    else
      flash[:notice] = "Already friend"
      redirect_to users_url
    end
  end

  # This action delete a record from friendships table
  def destroy
    @friendship = Friendship.find(params[:id]).destroy
    redirect_to users_url
  end
end
