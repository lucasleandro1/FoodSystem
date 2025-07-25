class ReplaceUserIdWithRestaurantIdInProducts < ActiveRecord::Migration[8.0]
  def change
    remove_reference :products, :user, foreign_key: true
    add_reference :products, :restaurant, foreign_key: true
  end
end
