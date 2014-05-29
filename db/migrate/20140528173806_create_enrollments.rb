class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :cohort_id
      t.boolean :active

      t.timestamps
    end
  end
end
