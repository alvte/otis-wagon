class CardCategory < ApplicationRecord
  belongs_to :card
  belongs_to :category
end
