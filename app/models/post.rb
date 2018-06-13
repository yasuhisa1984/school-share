class Post < ApplicationRecord
  belongs_to :user
  belongs_to :school
  belongs_to :course
  belongs_to :when_from

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
      score = skill.build_score(params[index])
      score.save
    end
  end

  def score_update(params)
    skills.each_with_index do |skill, index|
      skill.score.update(point: params[index][:point].to_i)
    end
  end

  def get_score_array
    skills.map { |item| item.score.point }
  end
end
