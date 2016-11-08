class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :status
      t.datetime :order_at

      t.timestamps null: false
    end
  end
end
