class Purchaser < ApplicationRecord
  has_many :sells

  validates :name, uniqueness: true
end
