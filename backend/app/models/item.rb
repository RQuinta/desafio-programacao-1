class Item < ApplicationRecord
  validates :description, uniqueness: true
end
