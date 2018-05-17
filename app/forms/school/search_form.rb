class School::SearchForm
  include ActiveModel::Model

  attr_accessor :school_name, :skill_name, :purpose_name, :address_area

  def search
    normalize_values
    school_relation = School
    school_relation = school_relation.where(name: school_name) if school_name.present?

    if address_area.present?
      school_relation = school_relation.joins(:addresses)
      school_relation = school_relation.where('addresses.area': address_area)
    end

    if purpose_name.present?
      school_relation = school_relation.joins(:purposes)
      school_relation = school_relation.where('purposes.name': purpose_name)
    end

    if skill_name.present?
      school_relation = school_relation.joins(:skills)
      school_relation = school_relation.where('skills.name LIKE(?)', "%#{skill_name}%")
    end

    school_relation = school_relation.distinct
    school_relation.order(:name)
  end

  private
  def normalize_values
    self.school_name = school_name
    self.purpose_name = purpose_name
    self.address_area = address_area
    self.skill_name = skill_name
  end
end
