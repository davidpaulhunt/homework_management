class FixSubmissionsAddColumn < ActiveRecord::Migration
  def change
    remove_column :submissions, :state
    add_column :submissions, :workflow_state, :string
  end
end
