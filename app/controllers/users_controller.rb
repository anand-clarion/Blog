class UsersController < ApplicationController
  
  # This action show users list.
  def index
    if current_user.admin?
      @users = User.where('id != ?', current_user.id)
    else
      @users = User.where(is_active: 1).where('id != ?', current_user.id)
    end
  end

  # This action Show an user's information.
  def show
    @user = User.find(params[:id])
  end

  # This action delete a record from users table.
  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_url
  end

  # This action search data from models.
  def search
    @school = Array.new
    @school << User.search(params[:search])
    @school << Post.search(params[:search])
    @school << Comment.search(params[:search])
  end

end
