class Event < ApplicationRecord
    has_many :reservations
    validates :username,:photo,:location,:event_date presence: true
end
