class DropUserIdColumnFromEnrollments < ActiveRecord::Migration
  def change
    remove_column :enrollments, :user_id

    add_column :enrollments, :student_id, :integer
  end
end
