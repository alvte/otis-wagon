class Professional < ApplicationRecord
  # belongs_to :chatroom
  belongs_to :user
  has_one :chatroom, dependent: :destroy

end
