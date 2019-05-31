class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :nom
      t.string :prenom
      t.integer :nbre_personne
      t.date :date_debut_reservation
      t.date :date_fin_reservation
      t.references :location, foreign_key: true
    end
  end
end
