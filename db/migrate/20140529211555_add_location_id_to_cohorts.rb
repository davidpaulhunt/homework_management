class AddLocationIdToCohorts < ActiveRecord::Migration
  def change
    add_column :cohorts, :location_id, :integer
  end
end
