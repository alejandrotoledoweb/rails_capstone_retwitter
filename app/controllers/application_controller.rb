class ApplicationController < ActionController::Base
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in
    !current_user.nil?
  end

  def logged_in_user
    return if logged_in
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  def feed
    Message.where('user_id = ?', id)
  end
end
