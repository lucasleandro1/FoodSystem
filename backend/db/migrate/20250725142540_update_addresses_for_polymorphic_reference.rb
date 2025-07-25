class UpdateAddressesForPolymorphicReference < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :addresses, :users
    remove_column :addresses, :user_id, :bigint

    add_reference :addresses, :user, foreign_key: true, null: true
    add_reference :addresses, :restaurant, foreign_key: true, null: true
  end
end
