class MessagesController < ApplicationController
  before_action do
    @consultation_room = ConsultationRoom.find(params[:consultation_room_id])
  end

  def index
    @messages = @consultation_room.messages
    if  @messages.length >10
      @over_ten = true
      @messages = Message.where(id: @messages[-10..-1].pluck(:id))
    end

    if params[:m]
      @over_ten = false
      @messages = @consultation_room.messages
    end

    if logged_in?
      if @messages.last
        @messages.where.not(user_id: current_user.id).update_all(read: true)
      end
    elsif logged_in_professional?
      if @messages.last
        @messages.where.not(professional_id: current_professional.id).update_all(read: true)
      end
    else
    end

    @messages = @messages.order(:created_at)
    @message = @consultation_room.messages.build

  end

  def create
    @message = @consultation_room.messages.build(message_params)
    if @message.save! 
      redirect_to consultation_room_messages_path(@consultation_room)
    else
      render 'index'
    end
  end

  private
 
  def message_params
    params.require(:message).permit(:body, :user_id, :professional_id, :read)
  end

end
