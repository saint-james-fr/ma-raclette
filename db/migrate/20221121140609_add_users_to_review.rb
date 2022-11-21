class AddUsersToReview < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :user, foreign_key: true
    add_column :bookings, :status, :string
    change_column_default :bookings, :status, "available"
  end
end
