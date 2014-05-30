class Cohort < ActiveRecord::Base
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments
  has_many :assignments, dependent: :destroy
  belongs_to :course
  belongs_to :location

  def listing
    course.title.titleize + " in " + location.city.capitalize + ", " + location.state.upcase
  end

  def when
    format_date(start_date)
  end

  def format_date(date)
    date.strftime("%b %d, %y")
  end

end
