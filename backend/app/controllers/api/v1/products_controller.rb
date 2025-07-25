class Api::V1::ProductsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @products = @restaurant.products
    render json: @products
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = @restaurant.products.find(params[:id])
    render json: @product
  end
end
