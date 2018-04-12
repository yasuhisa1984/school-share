class Post < ApplicationRecord
  belongs_to :users, optional: true
  has_many :post_schools, dependent: :destroy
  has_many :schools, through: :post_schools
  validates :story, presence: true, length: { maximum: 8000 }
end
