class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :notifications, as: :notifieable, dependent: :destroy

  after_create :notify_cohort

  def notify_cohort
    NewCommentJob.new.async.perform(cohort(self.commentable_type), self)
  end

  def load_commentable
    id = self.commentable_id
    resource = self.commentable_type.constantize
    resource.find(id)
  end

  private

  def cohort(comment_type)
    @cohort = []
    if comment_type == "Assignment"
      self.commentable.cohort.students.each do |s|
        @cohort << s
      end
      @cohort << self.commentable.cohort.instructor
    elsif comment_type == "Submission"
      @cohort << self.commentable.assignment.cohort.instructor
      @cohort << self.commentable.student
    end
    @cohort
  end

end
