class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :raclette
  has_many :reviews

  validates :date, presence: true
  validates :description, presence: true
  validates :small_eater, numericality: { greater_than_or_equal_to: 0 }
  validates :normal_eater, numericality: { greater_than_or_equal_to: 0 }
  validates :big_eater, numericality: { greater_than_or_equal_to: 0 }
  validates :veggies, numericality: { greater_than_or_equal_to: 0 }
  validates :status, acceptance: { accept: ['pending', 'accepted', 'declined', 'canceled'] }
  scope :pending, -> { where(status: "pending") }
  scope :accepted, -> { where(status: "accepted") }
  scope :declined, -> { where(status: "declined") }
  # validate :sum_eater

  # def sum_eater
  #   eaters = (small_eater + normal_eater + big_eater + veggies)
  #   if eaters > raclette.number_of_guests || eaters == 0
  #     errors.add(:base, 'sum of the eaters must be lower or equal to the number of possible guests for the event')
  #   end
  # end
end
