class Pizza < ActiveRecord::Base
  #Associations
  has_and_belongs_to_many :components
  has_many :cart_items, dependent: :destroy

  #Callbacks
  before_destroy { components.clear }

  #Validations
  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :promo_price, numericality: { greater_than: 0, allow_blank: true }

  #Instance methods
  def current_price
    promo_price.blank? ? price : promo_price
  end
end
