class Post < ApplicationRecord
  has_many :post_schools, dependent: :destroy
  has_many :schools, through: :post_schools
  validates :story, presence: true, length: { maximum: 8000 }
end
