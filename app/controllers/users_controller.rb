class UsersController < ApplicationController
  def index
    @users = User.all
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
  end

  def search
    @school = Array.new
    @school << User.search(params[:search])
    @school << Post.search(params[:search])
    @school << Category.search(params[:search])
    @school << Comment.search(params[:search])
  end
end
