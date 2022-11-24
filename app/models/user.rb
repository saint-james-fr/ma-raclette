class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one_attached :avatar
  has_many :raclettes
  has_many :bookings
<<<<<<< HEAD
  has_many :requests, through: :raclettes, source: :bookings
=======
>>>>>>> 81052673379dce7344c52f46117195b8c835fe59
end
