class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.integer :price
      t.string :period
      t.integer :school_id
      t.timestamps
    end
  end
end
