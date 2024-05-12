class Property < ApplicationRecord
  belongs_to :owner
  validates :property_type, inclusion: { in: %w(lot farm house_and_lot) }
end
