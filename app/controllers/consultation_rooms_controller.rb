class ConsultationRoomsController < ApplicationController
  def index
    @consultation_rooms = ConsultationRoom.all
  end

  def create
    if logged_in?
      if ConsultationRoom.find_by("(consultation_rooms.sender_id =? AND consultation_rooms.recipient_id =?)", params[:sender_id], params[:recipient_id]).present?
        @consultation_room = ConsultationRoom.find_by("(consultation_rooms.sender_id =? AND consultation_rooms.recipient_id =?)", params[:sender_id], params[:recipient_id])
      else
        @consultation_room = ConsultationRoom.create!(consultation_room_params)
      end
      redirect_to consultation_room_messages_path(@consultation_room)
    elsif logged_in_professional?
      if ConsultationRoom.find_by("(consultation_rooms.sender_id =? AND consultation_rooms.recipient_id =?)",params[:sender_id], params[:recipient_id]).present?
        @consultation_room = ConsultationRoom.find_by("(consultation_rooms.sender_id =? AND consultation_rooms.recipient_id =?)", params[:sender_id], params[:recipient_id])
      else
        @consultation_room = ConsultationRoom.create!(consultation_room_params)
      end
      redirect_to consultation_room_messages_path(@consultation_room)
    else
      redirect_to root_path
    end
  end

  private

  def consultation_room_params
    params.permit(:sender_id, :recipient_id)
  end

end
