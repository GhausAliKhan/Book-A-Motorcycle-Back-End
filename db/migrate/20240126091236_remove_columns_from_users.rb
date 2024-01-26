class RemoveColumnsFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_index :users, name: "index_users_on_role"
    remove_column :users, :role, :string
  end
end
