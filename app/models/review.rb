class Review < ApplicationRecord
  belongs_to :booking
  belong_to :raclette, through: :booking
end
