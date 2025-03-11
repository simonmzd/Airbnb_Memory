class Memorie < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :title, presence: true
  validates :image, presence: true
  validates :description, presence: true
end
