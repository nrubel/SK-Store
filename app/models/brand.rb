class Brand < ApplicationRecord
  has_one_attached :logo
  has_one_attached :admin_logo
  has_one_attached :footer_logo

  validates :title, presence: {message: "Must have a title"}
  validates :phone, presence: {message: "Must have a phone number"}
  validates :email, presence: {message: "Must have a email address"}
end
