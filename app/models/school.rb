class School < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :courses, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
end
