class Post < ApplicationRecord
  belongs_to :user
  belongs_to :school

  has_many :skills, dependent: :destroy
  accepts_nested_attributes_for :skills

  has_many :post_purposes, dependent: :destroy
  has_many :purposes, through: :post_purposes
  accepts_nested_attributes_for :post_purposes

  validates :story, presence: true, length: { maximum: 8000 }

  def build_info
    post_purposes.build
    5.times { skills.build }
  end

  def skill_remove_nil
    skills.select {|skill| skill.name.present?}
  end

  def register_table(params)
    register_middle_purpose_table
    register_skill_table
    register_score_table(params)
  end

  def register_middle_purpose_table
    purposes.first.school_purposes.build.update(school_id: school_id)
  end

  def register_skill_table
    skills.each do |skill|
      skill.update(school_id: school_id)
    end
  end

  def register_score_table(params)
    skills.each_with_index do |skill, index|
      build = skill.scores.build(params[index])
      build.skill_id = skill.id
      build.save
    end
  end
end
