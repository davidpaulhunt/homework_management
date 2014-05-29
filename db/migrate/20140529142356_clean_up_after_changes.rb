class CleanUpAfterChanges < ActiveRecord::Migration
  def change
    drop_table :courses_locations
    add_column :comments, :user_id, :integer
    add_column :assignments, :cohort_id, :integer
  end
end
