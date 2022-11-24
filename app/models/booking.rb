class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :raclette
  has_many :reviews

  validates :date, presence: true
  validates :description, presence: true
  validates :status, acceptance: { accept: ['pending', 'accepted', 'declined'] }
  validate :sum_eater

  def sum_eater
    if (small_eater + normal_eater + big_eater) > raclette.number_of_guests
      errors.add(:base, 'sum of the eaters must be lower or equal to the number of possible guests for the event')
    end
  end
end
