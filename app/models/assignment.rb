class Assignment < ActiveRecord::Base

  belongs_to :cohort
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :submissions
  has_many :notifications, as: :notifieable, dependent: :destroy

  #after_create :notify_cohort

  def get_student_submission(student)
    self.submissions.where(student_id: student.id)
  end

  def notify_cohort
    NewAssignmentJob.new.async.perform(self.cohort.users, self)
  end

  # state_machine initial: :new do
  #   state :reviewing
  #   state :complete
  #   state :incomplete

  #   event :review do
  #     transition :new => :reviewing
  #   end

  #   event :accept do
  #     transition :reviewing => :complete
  #   end

  #   event :reject do
  #     transition :reviewing => :incomplete
  #   end

  # end


end
