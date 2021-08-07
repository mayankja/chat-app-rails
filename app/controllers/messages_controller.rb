class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    ids = [current_user.id, params[:reciever_id]]
    messages = Message.where(sender_id: ids, reciever_id: ids)
    render json: messages, each_serializer: MessageSerializer
  end

  def create
    sender = current_user.id
    reciever = params[:reciever_id]
    body = params[:body]
    message = Message.new(body: body, sender_id: sender, reciever_id: reciever)
    if message.valid? && message.save
      render json: {"status": "message has sended", "message": message}
    else
      render json: message.error
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    render json: {"message": "message deleted"}
  end
end
