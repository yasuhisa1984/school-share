class CreatePurposes < ActiveRecord::Migration[5.1]
  def change
    create_table :purposes do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :purposes, :name, unique: true
  end
end
