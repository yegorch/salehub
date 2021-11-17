class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: true
end
