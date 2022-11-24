class Raclette < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :location, presence: true
  validates :title, presence: true

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
                  against: %i[title description],
                  using: { tsearch: { prefix: true } }
end
