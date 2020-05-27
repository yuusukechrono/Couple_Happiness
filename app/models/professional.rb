class Professional < ApplicationRecord
  validates :email, presence: true, length:{ maximum: 25}, format:{ with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  before_validation{ email.downcase!}
  has_secure_password
  validates :password, presence: true, length:{minimum: 6}
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  mount_uploader:professional_image, ProfessionalImageUploader

  has_many :consultation_rooms
  has_many :messages
end
