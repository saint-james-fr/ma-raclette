class Review < ApplicationRecord
  belongs_to :booking
  belong_to :raclette, through: :booking

  validates :rating, presence: true, numericality: { in: 0..5 }
  validates :description, presence: true
end
