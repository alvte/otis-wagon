class Card < ApplicationRecord
  has_many :photos
  has_many :card_categories
  has_many :categories, through: :card_categories

  include PgSearch::Model
  multisearchable against: [ :title, :summary, :content],
  using: {
    tsearch: { prefix: true }
  }
end
