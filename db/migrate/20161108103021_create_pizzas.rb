class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string :name
      t.decimal :price
      t.decimal :promo_price

      t.timestamps null: false
    end
  end
end
