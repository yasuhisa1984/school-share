class CreatePostSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :post_schools do |t|
      t.references :post, index: true, foreign_key: true
      t.references :school, index: true, foreign_key: true
      t.timestamps
    end
  end
end
