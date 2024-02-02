class CreateMotorcycles < ActiveRecord::Migration[7.1]
  def change
    create_table :motorcycles do |t|
      t.string :name
      t.string :color
      t.string :chassisNumber
      t.decimal :bookingPricePerHour
      t.string :brand
      t.string :model
      t.decimal :price
      t.text :imageLink
      t.text :description

      t.timestamps
    end
    add_index :motorcycles, :chassisNumber
  end
end
