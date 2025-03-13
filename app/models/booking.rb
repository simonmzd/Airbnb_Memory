class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :memorie
  validates :date, presence: true

  after_initialize :set_default_status, if: :new_record?

  def set_default_status
    self.status ||= "en attente"
  end
end
