class DropCoursesLocations < ActiveRecord::Migration
  def change
    drop_table :courses_locations

    create_table :courses_locations do |t|
      t.belongs_to :course
      t.belongs_to :location
    end
  end
end
