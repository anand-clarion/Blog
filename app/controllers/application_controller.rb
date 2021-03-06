class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  rescue_from CanCan::AccessDenied do | exception |
    redirect_to root_url, alert: exception.message
  end

  # This action for deactivate process 
  def deactivate
    @deactivate = params[:table_name].constantize .find(params[:id])
    @deactivate.is_active = 0
    @deactivate.save
    UserMailer.account_deactivated(@deactivate).deliver
    redirect_to posts_url
  end

  # This action for activate process
  def activate
    @activate = params[:table_name].constantize.find(params[:id])
    @activate.is_active = 1
    @activate.save
    UserMailer.account_activated(@activate).deliver
    redirect_to posts_url
  end
end
