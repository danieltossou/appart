class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
    	t.string :titre
    	t.references :location

    	t.timestamps
    end
  end
end