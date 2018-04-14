class PostSkill < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  belongs_to :skill, foreign_key: :skill_id
end
