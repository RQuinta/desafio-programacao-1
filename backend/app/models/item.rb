class Item < ApplicationRecord
  has_many :sells

  validates :description, uniqueness: true
end
