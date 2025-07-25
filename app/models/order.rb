class Order < ApplicationRecord


  belongs_to :user
  belongs_to :restaurant
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  belongs_to :pickup_address, class_name: "Address", optional: true
  belongs_to :delivery_address, class_name: "Address", optional: true
  enum :payment_method, pix: 0, credit_card: 1, cash: 2

  validates :total_price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :payment_method, :user_id, :pickup_address_id, :delivery_address_id, :description, presence: true

  before_save :calculate_total_price

  private

  def calculate_total_price
    self.total_price = order_products.includes(:product).sum do |order_product|
      order_product.quantity * order_product.product.price
    end
  end
end
