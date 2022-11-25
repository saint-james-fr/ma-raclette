class AddCoordinatesToRaclettes < ActiveRecord::Migration[7.0]
  def change
    add_column :raclettes, :latitude, :float
    add_column :raclettes, :longitude, :float
  end
end
