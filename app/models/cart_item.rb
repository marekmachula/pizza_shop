class CartItem < ActiveRecord::Base
  #Associations
  belongs_to :cart
  belongs_to :pizza
end
