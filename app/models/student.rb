class Student < User

  has_many :enrollments, dependent: :destroy
  has_many :cohorts, through: :enrollments
  has_many :submissions, dependent: :destroy

  def active_enrollments
    self.enrollments.joins(:cohort).where("start_date < ? AND end_date > ?", Date.today, Date.today)
  end


end