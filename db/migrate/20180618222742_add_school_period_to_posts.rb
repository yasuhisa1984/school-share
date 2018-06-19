class AddSchoolPeriodToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :school_period, foreign_key: true
  end
end
