class AddPostRefToCourses < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :course, foreign_key: true, null: false
  end
end
