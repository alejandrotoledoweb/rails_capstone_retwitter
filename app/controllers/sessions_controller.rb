class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:session][:username].downcase)
    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    flash.now[:danger] = 'Log out succesfully'
    redirect_to root_url
  end

  private

  def logged_in_user
    return if logged_in

    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user
  end
end
