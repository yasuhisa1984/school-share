class AddSkillIdToScores < ActiveRecord::Migration[5.1]
  def change
    add_reference :scores, :skill, foreign_key: true
  end
end
