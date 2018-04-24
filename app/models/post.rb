class Post < ApplicationRecord
  has_many :post_schools, dependent: :destroy
  has_many :schools, through: :post_schools
  accepts_nested_attributes_for :post_schools

  has_many :post_skills, dependent: :destroy
  has_many :skills, through: :post_skills
  accepts_nested_attributes_for :skills

  has_many :post_purposes, dependent: :destroy
  has_many :purposes, through: :post_purposes
  accepts_nested_attributes_for :post_purposes

  validates :story, presence: true, length: { maximum: 8000 }

  def build_info
    post_purposes.build
    post_schools.build
    5.times { skills.build }
  end

  def skill_remove_nil
    skills.select {|skill| skill.name.present?}
  end

  #すでにスキルが登録されている場合、登録用の中間テーブルインスタンスのハッシュを生成
  def skill_already_register?
    skill_remove_nil
    post_skill_array = Array.new
    school_skill_array = Array.new

    skills.each do |skill|
      if Skill.find_by_name(skill.name)
        skill_id = Skill.find_by_name(skill.name).id

        post_skill = skill.post_skills.build
        post_skill.skill_id = skill_id
        post_skill_array << post_skill

        school_skill = skill.school_skills.build
        school_skill.skill_id = skill_id
        school_skill_array << school_skill
      end
    end
    alredy_register_skill = {post_skills: post_skill_array, school_skills: school_skill_array}
  end

  def skill_duplication_remove
    skills.select {|skill| Skill.registered?(skill)}
  end

  def register_middle_table
    register_middle_school_table
    register_middle_purpose_table
  end

  def register_middle_school_table
    school_id = post_schools.first.school_id

    skills.each do |skill|
      skill.school_skills.build.update(school_id: school_id)
    end
  end

  def register_middle_purpose_table
    school_id = post_schools.first.school_id
    purposes.first.school_purposes.build.update(school_id: school_id)
  end

  def register_middle_skill_table(post_skill, school_skill)
    post_id = id
    school_id = post_schools.first.school_id

    post_skill.each do |skill|
      skill.update(post_id: post_id)
    end

    school_skill.each do |skill|
      skill.update(school_id: school_id)
    end
  end
end
