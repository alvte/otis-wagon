class Product < ApplicationRecord
  has_many_attached :photos
  has_many :product_categories
  has_many :categories, through: :product_categories
end
