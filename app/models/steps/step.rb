class Step < ApplicationRecord
  acts_as_paranoid

  scope :for_search, ->(query) { where("name ILIKE ?", "#{query}%") if query.present? }

end
