class Purpose < ApplicationRecord
  has_many :post_purposes, dependent: :destroy
  has_many :posts, through: :post_purpose

  has_many :school_purposes, dependent: :destroy
  has_many :schools, through: :school_purposes

  validates :name, uniqueness: true
end
