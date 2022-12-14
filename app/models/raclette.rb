class Raclette < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :location, presence: true
  validates :title, presence: true

  validates :number_of_guests, presence: true
  validates :photo, presence: true

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_location,
                  against: %i[location],
                  using: { tsearch: { prefix: true } }
end
