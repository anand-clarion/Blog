class UsersController < ApplicationController
  
  # This action show users list.
  def index
    if current_user.admin?
      @users = User.all
    else
      @users = User.where(is_active: 1)
    end
  end

  # This action Show an user's information.
  def show
    @user = User.find(params[:id])
    @inverse_friend = @user.inverse_friends
    @friends = @user.friendships
  end

  # This action delete a record from users table.
  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_url
  end

  # This action search data from models.
  def search
    if !params[:search].empty?
      @school = Array.new
      @school << User.search(params[:search])
      @school << Post.search(params[:search])
      @school << Comment.search(params[:search])
    else
      flash[:notice] = "Can't search for empty string"
      redirect_to posts_url
    end
  end

end
