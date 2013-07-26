class AddSendScanNotificationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :send_notification, :boolean, :default => false
  end
end
