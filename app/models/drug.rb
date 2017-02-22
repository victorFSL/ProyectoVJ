class Drug < ApplicationRecord
  validates :name, :active_ingredient, :description, :metric, :dosage, presence: true
  validates :dosage, numericality: {greater_than_or_equal_to:0.01}
  validates :picture, allow_blank: true. format:{ with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPGor PNG image.'}
end
