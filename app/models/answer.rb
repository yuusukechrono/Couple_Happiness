class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :answer_detail, length: { maximum: 200 } 
end
