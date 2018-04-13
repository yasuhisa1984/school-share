class Address < ApplicationRecord
  belongs_to :schools, optional: true
end
