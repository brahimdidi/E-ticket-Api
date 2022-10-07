class Reservation < ApplicationRecord
  belongs_to :user, :event
  validates :reservation_date, presence: true
end
