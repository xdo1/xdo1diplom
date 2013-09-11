class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
  def check_admin
    unless logged_in? && current_user.admin?
      error_message
    end
  end
  def not_authenticated
    unless logged_in?
      redirect_to login_path
    end
  end
  def error_message(msg='Доступ запрещен')
    @msg=msg
    render 'layouts/error'
  end
end