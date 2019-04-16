class Contrats < ActiveRecord::Migration[5.2]
  def change
  	create_table :contrats do |t|
  		t.references :reservation
  		t.references :user

  		t.timestamps
  	end
  end
end
