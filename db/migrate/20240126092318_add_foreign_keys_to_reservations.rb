class AddForeignKeysToReservations < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :reservations, :motorcycles
    add_foreign_key :reservations, :users
  end
end
