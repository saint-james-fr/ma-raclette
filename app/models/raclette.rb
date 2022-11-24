class Raclette < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :location, presence: true
  validates :title, presence: true

  has_one_attached :photo
end
