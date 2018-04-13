class Course < ApplicationRecord
  belongs_to :schools, optional: true
end
