class AddDataToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :age, :string
    add_column :users, :first_name, :string
    add_column :users, :display_name, :string
    add_column :users, :birthdate, :string
  end
end
