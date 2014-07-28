class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def show
    render :text => "hello you are in show action"
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
