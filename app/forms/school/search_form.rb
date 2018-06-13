class School::SearchForm
  include ActiveModel::Model

  attr_accessor :school_name, :skill_name, :purpose_name, :address_area

  def search
    normalize_values
    school = School
    school = school.where('schools.name LIKE(?)', "%#{school_name}%") if school_name.present?

    if address_area.present?
      school = school.joins(:addresses)
      school = school.where('addresses.area': address_area)
    end

    if purpose_name.present?
      school = school.joins(:purposes)
      school = school.where('purposes.name': purpose_name)
    end

    if skill_name.present?
      school = school.joins(:skills)
      school = school.where('skills.name LIKE(?)', "%#{skill_name}%")
    end

    school = school.distinct
    school.order(:name)
  end

  private
  def normalize_values
    self.school_name = school_name
    self.purpose_name = purpose_name
    self.address_area = address_area
    self.skill_name = skill_name
  end
end
