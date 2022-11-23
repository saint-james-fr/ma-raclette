class ChangeDefaultValuesToReviews < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:reviews, :rating, 0.1)
    change_column_default(:reviews, :description, "GEHJZGJHA")
  end
end
