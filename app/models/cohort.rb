class Cohort < ActiveRecord::Base
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments
  has_many :assignments, dependent: :destroy
  belongs_to :course
  belongs_to :location

  def listing
    course.title + " in " + location.where
  end

end
