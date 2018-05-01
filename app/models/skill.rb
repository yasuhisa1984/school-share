class Skill < ApplicationRecord
  has_many :post_skills, dependent: :destroy
  has_many :posts, through: :post_skills

  has_many :schools, dependent: :destroy

  has_many :scores, dependent: :destroy

  def self.registered?(table)
    self.find_by_name(table.name).blank? && table.name.present?
  end
end
