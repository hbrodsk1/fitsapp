class MessagesController < ApplicationController
  before_action :require_login
 
  def index
  	@sent_messages = Message.where(client_id: current_client.id)
  	@received_messages = Message.where(recipient: current_client.id)
  end

  def new
  	@message = Message.new
  	@recipients = Client.all
  end

  def create
  	@user = current_client
  	@message = @user.messages.build(message_params)

  	if @message.save
      flash[:alert] = "Message Created"
  		redirect_to messages_path
  	else
      flash.now[:error] = "Could not create message"
  		render 'new'
  	end
  end

  private

  def message_params
  	params.require(:message).permit(:body, :recipient, :client_id)
  end
 
  def require_login
    unless current_client
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_client_session_path
    end
  end
end
