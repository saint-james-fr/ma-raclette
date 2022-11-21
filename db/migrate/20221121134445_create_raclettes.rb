class CreateRaclettes < ActiveRecord::Migration[7.0]
  def change
    create_table :raclettes do |t|
      t.string :location
      t.string :photo
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
