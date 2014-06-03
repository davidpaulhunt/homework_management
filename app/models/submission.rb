class Submission < ActiveRecord::Base

  include Workflow

  workflow do
    state :new do
      event :review, transitions_to: :reviewed
    end
    state :reviewed do
      event :accept, transitions_to: :complete
      event :reject, transitions_to: :incomplete
    end
    state :complete
    state :incomplete do
      event :review, transitions_to: :reviewed
    end
  end

  belongs_to :student
  belongs_to :assignment
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :notifications, as: :notifieable, dependent: :destroy

  after_create :new_submission_notification

  def new_submission_notification
    NewSubmissionJob.new.async.perform(self)
    # self.student.new_submission_notification(self)
  end
  
end
