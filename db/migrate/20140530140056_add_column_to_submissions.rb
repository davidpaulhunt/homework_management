class AddColumnToSubmissions < ActiveRecord::Migration
  def change
    remove_column :submissions, :user_id
    add_column :submissions, :student_id, :integer
  end
end
