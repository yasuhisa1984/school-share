class Skill < ApplicationRecord
  has_many :posts, through: :post_skills
  validates :name, uniqueness: true
end
