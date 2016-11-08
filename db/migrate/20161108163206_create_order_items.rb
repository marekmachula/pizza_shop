class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.string :pizza_name
      t.decimal :pizza_price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
