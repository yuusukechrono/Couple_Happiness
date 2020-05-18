class Message < ApplicationRecord
  belongs_to :consultation_room
  belongs_to :user, optional:true
  belongs_to :professional, optional:true
  validates_presence_of :body, :consultation_room, :user_or_professional

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

private
  def user_or_professional
    user.present? || professional.present?
  end
end
