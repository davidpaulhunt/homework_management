class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  after_create :notify_cohort

  def notify_cohort
    case self.commentable_type
    when "Assignment"
      @cohort = self.commentable.cohort
      CommentMailer.notify_cohort_new_comment(@cohort.users, self).deliver
    when "Submission"
      @cohort = []
      @cohort << self.commentable.assignment.cohort.instructor
      @cohort << self.commentable.student
      CommentMailer.notify_cohort_new_comment(@cohort, self).deliver
    end
  end

end
