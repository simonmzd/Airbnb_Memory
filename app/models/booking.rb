class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :memorie
  validates :date, presence: true
end
