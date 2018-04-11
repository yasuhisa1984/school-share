class PostSchool < ApplicationRecord
  belongs_to :post, foreign_key: :post_id, optional: true
  belongs_to :school, foreign_key: :school_id, optional: true
end
