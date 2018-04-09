class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :url
      t.text :description
      t.boolean :remote, default: false, null: false
      t.string :school_image_url
      t.timestamps
    end
  end
end
