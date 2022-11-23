class AddColumnsToRaclette < ActiveRecord::Migration[7.0]
  def change
    add_column :raclettes, :number_of_guests, :integer
    add_column :raclettes, :title, :string
    add_column :raclettes, :description, :text
  end
end
