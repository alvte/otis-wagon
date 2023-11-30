class Card < ApplicationRecord
  has_many_attached :photos
  has_many :card_categories
  has_many :categories, through: :card_categories

  include PgSearch::Model
  pg_search_scope :search, against: [:title, :summary, :content],
  associated_against: {
    categories: [:name]
  },
  using: {
    tsearch: { prefix: true }
  }
end
