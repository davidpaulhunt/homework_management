class Student < User

  has_many :enrollments, dependent: :destroy
  has_many :cohorts, through: :enrollments
  has_many :submissions, dependent: :destroy

  def active_enrollments
    self.enrollments.joins(:cohort).where("start_date < ? AND end_date > ?", Date.today, Date.today)
  end

  def get_my_submission(assignment_id)
    self.submissions.where(assignment_id: assignment_id)
  end

  def new_submission_notification(submission)
    UserMailer.new_submission_created(self, submission).deliver
  end


end