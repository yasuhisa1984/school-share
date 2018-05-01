class Purpose < ApplicationRecord
  has_many :post_purposes
  validates :name, uniqueness: true
end
