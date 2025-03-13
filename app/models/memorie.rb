class Memorie < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many_attached :images
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true

  geocoded_by :location, latitude: :lat, longitude: :lng 
  after_validation :geocode, if: :location_changed?

  def coordinates
    [lat, lng] if lat && lng
  end
end
