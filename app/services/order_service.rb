class OrderService < BaseService
  def initialize(context, user)
    super context
    @user = user
  end

  def create_order
    order = Order.create(user_id: user.id, status: 'awaiting', order_at: DateTime.now)
    cart.cart_items.each do |item|
      order.order_items.create(
          pizza_name: item.pizza.name,
          pizza_price: item.pizza.current_price,
          quantity: item.quantity
      )
    end
    cart.destroy
  end

  def user
    @user
  end

  def cart
    @cart = Cart.where(id: session[:cart_id]).first
  end
end