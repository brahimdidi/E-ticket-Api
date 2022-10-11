class User < ApplicationRecord
  belongs_to :user
  has_many :reservations
  
  validates :username, presence: true, length: { in: 4..100 }

  def admin?
    role == 'admin'
  end
end
