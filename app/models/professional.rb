class Professional < ApplicationRecord
  belongs_to :user
  has_many :chatrooms, dependent: :destroy

end
