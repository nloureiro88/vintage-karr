class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :string
    add_column :users, :birthdate, :date
    add_column :users, :photo, :string
  end
end
