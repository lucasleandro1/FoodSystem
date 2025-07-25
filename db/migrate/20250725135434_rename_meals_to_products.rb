class RenameMealsToProducts < ActiveRecord::Migration[8.0]
  def change
    rename_table :meals, :products
  end
end
