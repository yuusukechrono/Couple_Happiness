class UserMatch < ApplicationRecord
  belongs_to :party, class_name: 'User', foreign_key: :party_id
  belongs_to :partner, class_name: 'User', foreign_key: :partner_id
end
