class RemoveAddressableFromAddresses < ActiveRecord::Migration[8.0]
  def change
    remove_column :addresses, :addressable_type, :string
    remove_column :addresses, :addressable_id, :bigint
    add_reference :addresses, :user, null: false, foreign_key: true
  end
end
