class CreateSchoolPeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :school_periods do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
