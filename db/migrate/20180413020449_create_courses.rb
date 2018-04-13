class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.integer :price
      t.string :period
      t.references :school, foreign_key: true, null: false
      t.timestamps
    end
  end
end
