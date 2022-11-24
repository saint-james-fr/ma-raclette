class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :raclette
  has_many :reviews

  validates :date, presence: true
  validates :description, presence: true
  validates :status, acceptance: { accept: ['pending', 'accepted', 'declined'] }
  scope :pending, -> { where(status: "pending") }
  scope :accepted, -> { where(status: "accepted") }
  validate :sum_eater

  def sum_eater
    eaters = (small_eater + normal_eater + big_eater + veggies)
    if eaters > raclette.number_of_guests || eaters == 0
      errors.add(:base, 'sum of the eaters must be lower or equal to the number of possible guests for the event')
    end
  end
end
