class Event < ApplicationRecord
  has_many :reservations
  validates :name, :photo, :location, :event_date, presence: true
  validates :ticket_price,:seats_available, numericality: { greater_than_or_equal_to: 0 }
end
