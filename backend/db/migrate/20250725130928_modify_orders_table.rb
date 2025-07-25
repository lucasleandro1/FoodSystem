class ModifyOrdersTable < ActiveRecord::Migration[8.0]
  def change
    def change
      remove_column :orders, :pickup_address, :string
      remove_column :orders, :delivery_address, :string
      remove_column :orders, :item_description, :text
      remove_column :orders, :estimated_price, :decimal

      add_column :orders, :quantity, :integer, default: 1, null: false
      add_column :orders, :unit_price, :decimal, precision: 10, scale: 2, default: 0.0, null: false
      add_column :orders, :total_price, :decimal, precision: 10, scale: 2, default: 0.0, null: false
      add_column :orders, :payment_method, :string, default: "cash", null: false
    end
  end
end
