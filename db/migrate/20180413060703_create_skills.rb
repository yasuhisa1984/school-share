class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.references :post, foreign_key: true
      t.references :school, foreign_key: true
      t.timestamps
    end
  end
end
