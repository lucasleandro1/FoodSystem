module Api
  module V1
    class OrdersController < ApplicationController
      before_action :authenticate_devise_api_token!
      before_action :set_order, only: %i[ show update destroy ]

      def index
        @orders = current_devise_api_user.orders.all
        render json: @orders
      end

      def show
        render json: @order
      end

      def create
        @order = Order.new(order_params)

        if @order.save
          render json: @order, status: :created
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      def update
        if @order.update(order_params)
          render json: @order
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @order.destroy!
        head :no_content
      end

      private

      def set_order
        @order = Order.find(params[:id])
      end

      def order_params
        params.require(:order).permit(:user_id, :pickup_address, :delivery_address, :item_description, :requested_at, :estimated_price)
      end
    end
  end
end
