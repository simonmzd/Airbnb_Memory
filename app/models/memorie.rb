class Memorie < ApplicationRecord
  has_many :bookings
  validates :title, presence: true
  validates :image, presence: true
  validates :description, presence: true 
end
