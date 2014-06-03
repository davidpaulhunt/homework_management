class NewCommentJob
  include SuckerPunch::Job

  def perform(group, comment)
    build_notifications(group, comment)
    CommentMailer.notify_cohort_new_comment(group, comment)
  end

  def build_notifications(group, comment)
    group.each do |user|
      note = user.notifications.build
      note.notifieable_id = comment.id
      note.notifieable_type = "Comment"
      note.save!
    end
  end

end