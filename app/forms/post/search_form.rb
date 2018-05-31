class Post::SearchForm
  include ActiveModel::Model

  attr_accessor :school_name, :skill_name, :purpose_name, :address_area

  def search
    normalize_values
    post_relation = Post

    if school_name.present?
      post_relation = post_relation.joins(:school)
      post_relation = post_relation.where('schools.name LIKE(?)', "%#{school_name}%")
    end

    if purpose_name.present?
      post_relation = post_relation.joins(:purposes)
      post_relation = post_relation.where('purposes.name': purpose_name)
    end

    if skill_name.present?
      post_relation = post_relation.joins(:skills)
      post_relation = post_relation.where('skills.name LIKE(?)', "%#{skill_name}%")
    end

    post_relation = post_relation.distinct
  end

  private
  def normalize_values
    self.school_name = school_name
    self.purpose_name = purpose_name
    self.skill_name = skill_name
  end
end
