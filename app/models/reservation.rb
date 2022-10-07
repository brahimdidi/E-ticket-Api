class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :reservation_date, presence: true
end
