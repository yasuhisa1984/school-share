class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :work
      t.text :story
      t.integer :post_id
      t.timestamps
    end
  end
end
