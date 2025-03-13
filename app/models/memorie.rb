class Memorie < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many_attached :images
  validates :title, presence: true
  validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :search_all,
    against: %i[ title date description location ],
    using: {
      tsearch: { prefix: true }
    }
end
