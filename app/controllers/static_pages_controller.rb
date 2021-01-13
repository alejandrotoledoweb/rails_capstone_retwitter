class StaticPagesController < ApplicationController
  def home
    @message = current_user.messages.build if logged_in
    @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10) if logged_in
    @users = User.all.order(created_at: :desc)
  end

  private

  def logged_in
    !current_user.nil?
  end
end
