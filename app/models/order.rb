class Order < ActiveRecord::Base
  #Associations
  belongs_to :user
  has_many :order_items, dependent: :destroy

  #Instance methods
  def total_amount
    order_items.map do |item|
      item.quantity * item.pizza_price
    end.inject {|sum, amount| sum += amount}.to_f
  end

  def number
    "EP-120#{self.id.to_s}"
  end
end
