class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :name, null: false
      t.string :postalcode
      t.string :area
      t.references :school, foreign_key: true, null: false
      t.timestamps
    end
  end
end
