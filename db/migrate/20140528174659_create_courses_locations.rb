class CreateCoursesLocations < ActiveRecord::Migration
  def change
    create_table :courses_locations do |t|
      t.belongs_to :courses
      t.belongs_to :locations
    end
  end
end
