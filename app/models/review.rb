class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user

  validates :rating, presence: true, numericality: { in: 0..5 }
  validates :description, presence: true
end
