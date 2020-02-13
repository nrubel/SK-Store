class Menu < ApplicationRecord
  belongs_to :navigation

  validates :name, :route, :navigation_id, presence: true
end
