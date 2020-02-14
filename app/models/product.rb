class Product < ApplicationRecord
  has_one_attached :featured
  has_many_attached :gallery
end
