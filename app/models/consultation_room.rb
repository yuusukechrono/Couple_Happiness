class ConsultationRoom < ApplicationRecord
  belongs_to :user, foreign_key: :sender_id, class_name: 'User'
  belongs_to :professional, foreign_key: :recipient_id, class_name: 'Professional'

  has_many :messages, dependent: :destroy

end
