class SessionsController < ApplicationController
  def new
    render :layout => false

  end

  def create
    if login(params[:username],params[:password])
      redirect_to root_path
    else
      render :new
    end
  end
  def destroy
    logout
    redirect_to login_path
  end
end