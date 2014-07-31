class UsersController < ApplicationController
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

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_url
  end

  def search
    @school = Array.new
    @school << User.search(params[:search])
    @school << Post.search(params[:search])
    @school << Category.search(params[:search])
    @school << Comment.search(params[:search])
  end
end
