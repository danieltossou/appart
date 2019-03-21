class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :user_id, null: false
      t.string :notify_type, null: false
      t.references :reservation
      t.boolean :vue, :default => false

      t.timestamps
    end
  end
end
