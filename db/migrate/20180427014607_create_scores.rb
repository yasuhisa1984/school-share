class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.integer :point, null: false
      t.references :skill, foreign_key: true
      t.timestamps
    end
  end
end
