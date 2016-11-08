class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      order_service = OrderService.new(self, @user)
      order_service.create_order
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :email, :phone, :street, :city)
  end
end