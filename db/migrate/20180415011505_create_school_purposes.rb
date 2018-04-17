class CreateSchoolPurposes < ActiveRecord::Migration[5.1]
  def change
    create_table :school_purposes do |t|
      t.references :school, foreign_key: true
      t.references :purpose, foreign_key: true
      t.timestamps
    end
  end
end
