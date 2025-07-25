class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  enum :payment_method, pix: 0, credit_card: 1, cash: 2

  validates :payment_method, presence: true
  validates :total_price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  before_save :calculate_total_price

  private

  def calculate_total_price
    self.total_price = order_products.includes(:product).sum do |order_product|
      order_product.quantity * order_product.product.price
    end
  end
end
