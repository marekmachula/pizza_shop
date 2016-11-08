class Component < ActiveRecord::Base
  #Assosciations
  has_and_belongs_to_many :pizzas

  #Callbacks
  before_destroy { pizzas.clear }

  #Validations
  validates :name, presence: true
  validates :name, uniqueness: true
end
