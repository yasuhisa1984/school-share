class CreatePostSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :post_skills do |t|
      t.references :post, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true
      t.timestamps
    end
    add_index :post_skills, [:post_id, :skill_id], unique: true
  end
end
