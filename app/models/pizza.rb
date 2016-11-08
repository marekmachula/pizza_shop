class Pizza < ActiveRecord::Base
  #Associations
  has_and_belongs_to_many :components

  #Callbacks
  before_destroy { components.clear }

  # Validations
  validates :name, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :price, numericality: true, allow_blank: true
end
