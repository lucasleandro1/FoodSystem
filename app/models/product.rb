class Product < ApplicationRecord
  belongs_to :restaurant
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
