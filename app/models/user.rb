class User < ApplicationRecord
  validates :email, presence: true, length:{ maximum: 25}, format:{ with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  before_validation{ email.downcase!}
  has_secure_password
  validates :password, presence: true, length:{minimum: 6}
  mount_uploader:image, ImageUploader

  has_many :answers
  has_many :plans
  has_many :promises
  has_many :consultation_rooms
  has_many :messages

  has_one :user_matches

  has_one :parties, class_name: "UserMatch"
  has_one :partners, class_name: "UserMatch"

end
