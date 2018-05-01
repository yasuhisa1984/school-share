class Post < ApplicationRecord
  has_many :post_schools, dependent: :destroy
  has_many :schools, through: :post_schools

  has_many :post_skills, dependent: :destroy
  has_many :skills, through: :post_skills

  has_many :post_purposes, dependent: :destroy
  has_many :purposes, through: :post_purposes

  has_many :post_schools, dependent: :destroy
  has_many :schools, through: :post_schools
  validates :story, presence: true, length: { maximum: 8000 }
end
