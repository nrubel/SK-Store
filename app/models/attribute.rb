class Attribute < ApplicationRecord
  validates :name, :values, presence: true
end
