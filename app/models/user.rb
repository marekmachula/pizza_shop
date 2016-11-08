class User < ActiveRecord::Base
  #Associations
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy

  #Validations
  validates :name, :surname, :email, :phone, :street, :city, presence: true
end
