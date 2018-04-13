class School < ApplicationRecord
  has_many :post_schools, dependent: :destroy
  has_many :posts, through: :post_schools
  has_many :addresses, dependent: :destroy
  has_many :courses, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30 }
end
