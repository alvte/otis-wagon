class Category < ApplicationRecord
  has_many :card_categories
  has_many :product_categories
  has_many :cards, through: :card_categories
  has_many :products, through: :product_categories


  include PgSearch::Model
  multisearchable against: [ :name],
  using: {
    tsearch: { prefix: true }
  }
end
