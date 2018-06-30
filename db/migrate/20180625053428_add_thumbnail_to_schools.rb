class AddThumbnailToSchools < ActiveRecord::Migration[5.1]
  def change
    add_column :schools, :thumbnail, :string
  end
end
