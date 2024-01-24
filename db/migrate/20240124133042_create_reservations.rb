class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.decimal :duration
      t.decimal :total
      t.bigint :user_id
      t.bigint :motorcycle_id

      t.timestamps
    end

    add_index :reservations, :user_id
    add_index :reservations, :motorcycle_id
  end
end
