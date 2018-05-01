class AddPostIdAndSchoolIdToPostSchools < ActiveRecord::Migration[5.1]
  def change
    add_index :post_schools, [:post_id, :school_id], unique: true
  end
end
