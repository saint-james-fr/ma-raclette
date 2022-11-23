class ChangeColumnDefaultValuesToReviews < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:reviews, :rating, nil)
    change_column_default(:reviews, :description, "")
  end
end
