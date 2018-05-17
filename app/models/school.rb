class School < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :skills, dependent: :destroy

  has_many :school_purposes, dependent: :destroy
  has_many :purposes, through: :school_purposes

  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
end
