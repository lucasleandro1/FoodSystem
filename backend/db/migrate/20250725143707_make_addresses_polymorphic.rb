class MakeAddressesPolymorphic < ActiveRecord::Migration[8.0]
  def change
    remove_reference :addresses, :user, foreign_key: true
    remove_reference :addresses, :restaurant, foreign_key: true

    add_reference :addresses, :addressable, polymorphic: true, null: false
  end
end
