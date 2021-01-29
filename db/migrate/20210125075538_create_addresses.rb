class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode,                     null: false
      t.integer :shipping_prefecture_id,      null: false
      t.string :address,                      null: false
      t.string :house_number,                 null: false
      t.string :building_number
      t.string :phone_number,                 null: false
      t.references :sold,                     foreign_key: true
      t.timestamps
    end
  end
end
