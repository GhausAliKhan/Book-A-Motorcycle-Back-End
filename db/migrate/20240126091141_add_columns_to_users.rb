class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :admin, :boolean
    add_column :users, :token, :text
  end
end
