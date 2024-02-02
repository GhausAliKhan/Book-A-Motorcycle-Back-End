class AddNotNullToReservationsColumns < ActiveRecord::Migration[7.1]
  def change
    change_column :reservations, :user_id, :bigint, null: false
    change_column :reservations, :motorcycle_id, :bigint, null: false
  end
end
