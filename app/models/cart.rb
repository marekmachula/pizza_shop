class Cart < ActiveRecord::Base
  #Associations
  has_many :cart_items, dependent: :destroy
  belongs_to :user

  #Instance methods
  def total_amount
    cart_items.map do |item|
      item.quantity * item.pizza.current_price
    end.inject {|sum, amount| sum += amount}.to_f
  end
end
