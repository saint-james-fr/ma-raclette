class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :raclette
  has_many :reviews

  validates :date, presence: true
  validates :description, presence: true
  validates :status, acceptance: { accept: ['pending', 'accepted', 'declined'] }
  scope :pending, -> { where(status: "pending") } # creates a symbol for pending
end
