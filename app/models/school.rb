class School < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :skills, dependent: :destroy

  has_many :school_purposes, dependent: :destroy
  has_many :purposes, through: :school_purposes

  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true

  private
  def normalize_values
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
    self.postal_code = normalize_as_postal_code(postal_code)
  end
end
