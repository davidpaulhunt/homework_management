class AddRelationships < ActiveRecord::Migration
  def change
    add_column :cohorts, :course_id, :integer
  end
end
