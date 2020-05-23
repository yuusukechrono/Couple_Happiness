class Category < ApplicationRecord
  has_many :questions
  has_many :promises
  has_many :meetings
end
