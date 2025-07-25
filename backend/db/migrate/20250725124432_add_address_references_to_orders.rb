class AddAddressReferencesToOrders < ActiveRecord::Migration[8.0]
  def change
    add_reference :orders, :pickup_address, foreign_key: { to_table: :addresses }
    add_reference :orders, :delivery_address, foreign_key: { to_table: :addresses }
  end
end
