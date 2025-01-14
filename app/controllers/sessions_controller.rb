class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      log_in user
      flash[:success] = t "flash.sign_in_success"
      redirect_back_or user
    else
      flash.now[:danger] = t "flash.invalid_sign_in"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
