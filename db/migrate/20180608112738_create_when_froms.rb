class CreateWhenFroms < ActiveRecord::Migration[5.1]
  def change
    create_table :when_froms do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
