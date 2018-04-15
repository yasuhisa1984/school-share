class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :history, :text
    add_column :users, :future, :text
  end
end
