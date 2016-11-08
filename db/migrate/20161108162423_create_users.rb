class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :street
      t.string :city
      t.string :phone

      t.timestamps null: false
    end
  end
end
