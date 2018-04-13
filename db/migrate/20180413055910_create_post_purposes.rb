class CreatePostPurposes < ActiveRecord::Migration[5.1]
  def change
    create_table :post_purposes do |t|
      t.references :post, index: true, foreign_key: true
      t.references :purpose, index: true, foreign_key: true
      t.timestamps
    end
    add_index :post_purposes, [:post_id, :purpose_id], unique: true
  end
end
