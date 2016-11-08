class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.where(status: 'awaiting').order('order_at asc')
  end

  def show
    @order = Order.find(params[:id])
  end
end