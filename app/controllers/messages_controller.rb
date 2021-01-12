class MessagesController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:succes] = 'Message created!'
      redirect_to root_url
    else
      flash[:notice] = 'Message is empty, please type something!'
      @feed_items = current_user.feed.paginate(page: params[:page])
      redirect_to root_path
    end
  end

  def destroy; end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def logged_in_user
    unless logged_in
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
end
