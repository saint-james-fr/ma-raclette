class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :raclette
  has_many :reviews
end
