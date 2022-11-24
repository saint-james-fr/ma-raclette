class AddDefaultToBookings < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookings, :small_eater, 0
    change_column_default :bookings, :normal_eater, 0
    change_column_default :bookings, :big_eater, 0
    change_column_default :bookings, :veggies, 0
  end
end
