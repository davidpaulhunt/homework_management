class Submission < ActiveRecord::Base

  belongs_to :student
  belongs_to :assignment
  has_many :comments, as: :commentable, dependent: :destroy

  after_create :new_submission_notification

  def new_submission_notification
    self.student.new_submission_notification(self)
  end
  
end
