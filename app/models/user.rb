class User < ApplicationRecord
  has_many :reservations
  validates :username, presence: true, length: { in: 1..100 }
end
