class AddColumnToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :type_reservation, :string
  end
end
