class Post::SearchForm
  include ActiveModel::Model

  attr_accessor :school_name, :skill_name, :purpose_name, :address_area

  def search
    normalize_values
    post = Post

    if school_name.present?
      post = post.joins(:school)
      post = post.where('schools.name LIKE(?)', "%#{school_name}%")
    end

    if purpose_name.present?
      post = post.joins(:purposes)
      post = post.where('purposes.name': purpose_name)
    end

    if skill_name.present?
      post = post.joins(:skills)
      post = post.where('skills.name LIKE(?)', "%#{skill_name}%")
    end

    post = post.distinct
  end

  private
  def normalize_values
    self.school_name = school_name
    self.purpose_name = purpose_name
    self.skill_name = skill_name
  end
end
