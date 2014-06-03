class AddColumnToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :workflow_state, :string
  end
end
