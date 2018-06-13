class Skill < ApplicationRecord
  belongs_to :post
  has_one :score

  def self.registered?(table)
    self.find_by_name(table.name).blank? && table.name.present?
  end
end
