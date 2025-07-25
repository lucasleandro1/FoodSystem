class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_devise_api_token!

  def create
    @order = current_user.orders.build(order_params)
    @order.restaurant = @restaurant
    @order.total_price = calculate_total_price(@order)

    if @order.save
      render json: @order, status: :created
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @orders = current_user.orders
    render json: @orders
  end

  private

  def order_params
    params.require(:order).permit(
      order_products_attributes: [ :product_id, :quantity ]
    )
  end

  def calculate_total_price(order)
    order.order_products.sum { |item| item.product.price * item.quantity }
  end
end
