class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :work
      t.text :story
      t.references :school, foreign_key: true
      t.timestamps
    end
  end
end
