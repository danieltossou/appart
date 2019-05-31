class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :titre
      t.text :description
      t.boolean :etat
      t.text :adresse
      t.integer :prix

      t.timestamps
    end
  end
end
