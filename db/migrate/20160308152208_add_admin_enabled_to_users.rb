class AddAdminEnabledToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_enabled, :boolean, default: false
  end

  def down
    remove_column :users, :admin_enabled
  end
end
