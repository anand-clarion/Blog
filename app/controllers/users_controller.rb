class UsersController < ApplicationController
  
  # This action show users list.
  def index
    if current_user.admin?
      @users = User.all
    else
      @users = User.where(is_active: 1)
    end
  end

  def new
  end

  def create
  end

  # This action Show an user's information.
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
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
