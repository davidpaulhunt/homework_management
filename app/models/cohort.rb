class Cohort < ActiveRecord::Base
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments
  has_many :assignments, dependent: :destroy
  belongs_to :course
  belongs_to :location
  belongs_to :instructor

  def listing
    course.title.titleize + " in " + location.city.capitalize + ", " + location.state.upcase
  end

  def when
    format_date(start_date)
  end

  def format_date(date)
    date.strftime("%b %d, %y")
  end

  def users
    @users = []
    if self.students
      self.students.each do |student|
        @users << student
      end
    end
    @users << self.instructor unless nil
    # @users << self.teaching_assistant unless nil
    @users
  end

end
