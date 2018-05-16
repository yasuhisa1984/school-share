class School::SearchForm
  include ActiveModel::Model

  attr_accessor :school_name, :skill_name, :purpose_name, :address_area

  def search
    normalize_values
    rel = School
    rel = rel.where(name: school_name) if school_name.present?

    if address_area.present?
      rel = rel.joins(:addresses)
      rel = rel.where('addresses.area': address_area)
    end

    if purpose_name.present?
      rel = rel.joins(:purposes)
      rel = rel.where('purposes.name': purpose_name)
    end

    if skill_name.present?
      rel = rel.joins(:skills)
      rel = rel.where('skills.name LIKE(?)', "%#{skill_name}%")
    end

    rel = rel.distinct
    rel.order(:name)
  end

  private
  def normalize_values
    self.school_name = school_name
    self.purpose_name = purpose_name
    self.address_area = address_area
    self.skill_name = skill_name
  end
end
