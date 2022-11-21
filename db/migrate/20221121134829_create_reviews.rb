class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :description
      t.float :rating
      t.references :booking, null: false, foreign_key: true
      t.timestamps
    end
  end
end
