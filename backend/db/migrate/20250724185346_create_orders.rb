class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :pickup_address
      t.string :delivery_address
      t.text :item_description
      t.datetime :requested_at, index: true
      t.decimal :estimated_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
