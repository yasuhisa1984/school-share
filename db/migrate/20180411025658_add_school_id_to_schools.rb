class AddSchoolIdToSchools < ActiveRecord::Migration[5.1]
  def change
    add_column :schools, :school_id, :integer
  end
end
