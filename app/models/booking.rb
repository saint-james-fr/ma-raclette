class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :raclette
  has_many :reviews

  validates :date, presence: true
  validates :description, presence: true
  validates :status, acceptance: { accept: ['pending', 'accepted', 'declined'] }
  validates :sum_eater, presence: true

  def sum_eater
    if (small_eater.to_i + normal_eater.to_i + big_eater.to_i) <= raclette.number_of_guests
      errors.add(:base, 'sum of the eaters must be lower or equal to the number of possible guests for the event')
    end
  end
end
