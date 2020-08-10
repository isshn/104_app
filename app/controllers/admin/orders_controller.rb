class Admin::OrdersController < ApplicationController
	def top
	end

	def index
		@orders = Order.all
	end

	def show
		@status = Order.new
		@order = Order.find(params[:id])
		@ditail = OrderDetail.new
	end

	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
		redirect_to admin_order_path(@order.id)
	end
	private
	def order_params
		params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :status)
	end
end
