class AddColumnTaToCohorts < ActiveRecord::Migration
  def change
    add_column :cohorts, :teaching_assistant_id, :integer
  end
end
