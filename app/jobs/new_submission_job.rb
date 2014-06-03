class NewSubmissionJob
  include SuckerPunch::Job

  def perform(submission)
    group = []
    group << submission.student
    group << submission.assignment.cohort.instructor
    build_notifications(group, submission)
    SubmissionMailer.notify_cohort_new_submission(group, submission)
  end

  def build_notifications(group, submission)
    group.each do |user|
      note = user.notifications.build
      note.notifieable_id = submission.id
      note.notifieable_type = "Submission"
      note.save!
    end
  end

end