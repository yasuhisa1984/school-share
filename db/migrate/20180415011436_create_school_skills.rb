class CreateSchoolSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :school_skills do |t|
      t.references :school, foreign_key: true
      t.references :skill, foreign_key: true
      t.timestamps
    end
  end
end
