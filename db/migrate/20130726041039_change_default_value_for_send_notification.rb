class ChangeDefaultValueForSendNotification < ActiveRecord::Migration
  def up
    change_column :users, :send_notification, :boolean, :default => true
  end

  def down
    change_column :users, :send_notification, :boolean, :default => false
  end
end
