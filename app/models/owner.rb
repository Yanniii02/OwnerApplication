class Owner < ApplicationRecord
  has_many :vehicles
  has_many :properties
end
