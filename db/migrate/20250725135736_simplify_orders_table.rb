class SimplifyOrdersTable < ActiveRecord::Migration[8.0]
  def change
    remove_column :orders, :pickup_address, :string
    remove_column :orders, :delivery_address, :string
    remove_column :orders, :item_description, :text
    remove_column :orders, :requested_at, :datetime
    remove_column :orders, :estimated_price, :decimal
    remove_column :orders, :pickup_address_id, :bigint
    remove_column :orders, :delivery_address_id, :bigint

    add_reference :orders, :restaurant, foreign_key: true
    add_column :orders, :total_price, :decimal, precision: 10, scale: 2
    add_column :orders, :payment_method, :integer
  end
end
