class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :neighborhood
      t.string :number
      t.references :addressable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
