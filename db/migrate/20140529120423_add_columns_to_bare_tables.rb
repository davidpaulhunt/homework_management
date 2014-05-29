class AddColumnsToBareTables < ActiveRecord::Migration
  def change
    add_column :cohorts, :start_date, :date
    add_column :cohorts, :end_date, :date
    add_column :courses, :title, :string
    add_column :courses, :technologies, :string
  end
end
