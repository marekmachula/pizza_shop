class HomeController < ApplicationController
  def index
    @pizzas = Pizza.order('price asc')
    @cart = Cart.new
    @current_cart = Cart.where(id: session[:cart_id]).first
  end
end