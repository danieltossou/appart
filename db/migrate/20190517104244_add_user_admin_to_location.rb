class AddUserAdminToLocation < ActiveRecord::Migration[5.2]
  def change
    add_reference :locations, :admin_user, foreign_key: true
  end
end
