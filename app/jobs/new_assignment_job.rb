class NewAssignmentJob
  include SuckerPunch::Job

  def perform(group, assignment)
    build_notifications(group, assignment)
    AssignmentMailer.notify_cohort_new_assignment(group, assignment)
  end

  def build_notifications(group, assignment)
    group.each do |user|
      note = user.notifications.build
      note.notifieable_id = assignment.id
      note.notifieable_type = "Assignment"
      note.save!
    end
  end

end