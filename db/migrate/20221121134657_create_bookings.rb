class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :raclette, null: false, foreign_key: true
      t.timestamps
    end
  end
end
