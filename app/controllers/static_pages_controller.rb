class StaticPagesController < ApplicationController

  def home
    @message = current_user.messages.build if logged_in
  end

  def about
    
  end

  def contact
  end

  private

  def logged_in
    !current_user.nil?
  end
  
end
