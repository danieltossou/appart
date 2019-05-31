class AddDureeToLocations < ActiveRecord::Migration[5.2]
  def change
  	add_column :locations, :duree, :string
  end
end
