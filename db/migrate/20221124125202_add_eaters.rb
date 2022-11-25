class AddEaters < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :big_eater, :integer
    add_column :bookings, :normal_eater, :integer
    add_column :bookings, :small_eater, :integer
    add_column :bookings, :veggies, :integer
  end
end
