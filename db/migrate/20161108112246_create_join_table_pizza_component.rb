class CreateJoinTablePizzaComponent < ActiveRecord::Migration
  def change
    create_join_table :pizzas, :components do |t|
      # t.index [:pizza_id, :component_id]
      # t.index [:component_id, :pizza_id]
    end
  end
end
