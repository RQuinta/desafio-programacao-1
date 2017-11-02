class Purchaser < ApplicationRecord
  validates :name, uniqueness: true
end
