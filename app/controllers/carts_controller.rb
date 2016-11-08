class CartsController < ApplicationController

  def create
    cart_service = CartService.new self
    cart_service.add_pizza
    redirect_to root_path
  end
end