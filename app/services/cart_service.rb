class CartService < BaseService
  def initialize(context)
    super context
  end

  START_Q = 1

  def add_pizza
    if cart.cart_items.map{|c_i| c_i.pizza_id.to_s}.include? pizza_id
      cart_item.increment!(:quantity, by = 1)
    else
      cart_item.save
      cart.cart_items << cart_item
    end
  end

  def cart
    @cart = Cart.where(id: session[:cart_id]).first
    @cart ||= Cart.create
    session[:cart_id] = @cart.id unless session[:cart_id].present? && session[:cart_id] == @cart.id
    @cart
  end

  def pizza
    @pizza ||= Pizza.find(pizza_id)
  end

  def cart_item
    @cart_item ||= cart.cart_items.where(pizza_id: pizza.id).first
    @cart_item ||= CartItem.new(pizza_id: pizza.id, quantity: START_Q, cart_id: cart.id)
  end

  def pizza_id
    params[:cart][:pizza_id]
  end

  def quantity
    params[:cart][:quantity]
  end
end