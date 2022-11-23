class Raclette < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :location, presence: true
  validates :title, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
