class PostsController < ApplicationController
  layout :is_admin

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  private
    def is_admin
      current_user.admin? ? "admin" : "application"
    end
end
