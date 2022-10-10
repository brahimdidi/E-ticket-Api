class User < ApplicationRecord
  has_many :reservations
  validates :username, presence: true, length: { in: 4..100 }
end
