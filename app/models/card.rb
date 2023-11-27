class Card < ApplicationRecord
  #has_many :photos
  has_many :card_categories
  has_many :categories, through: :card_categories
end
