class RemoveAddressIdFromRestaurants < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :restaurants, :addresses
    remove_column :restaurants, :address_id, :bigint
  end
end
