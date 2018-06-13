class AddWhenFromIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :when_from, foreign_key: true
  end
end
