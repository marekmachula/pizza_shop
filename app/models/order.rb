class Order < ActiveRecord::Base
  #Associations
  has_many :order_items, dependent: :destroy
end
