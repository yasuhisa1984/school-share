class Course < ApplicationRecord
  belongs_to :school
  has_many :post
end
