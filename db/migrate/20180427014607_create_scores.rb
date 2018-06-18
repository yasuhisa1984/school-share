class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.integer :point, null: false
      t.timestamps
    end
  end
end
