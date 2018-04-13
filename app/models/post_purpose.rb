class PostPurpose < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  belongs_to :purpose, foreign_key: :purpose_id
end
