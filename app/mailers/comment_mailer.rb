class CommentMailer < ActionMailer::Base
  default from: "tiyhomework@gmail.com"

  def new_comment(user, comment)
    @user = user
    @comment = comment
    mail(to: user.email, subject: "There's a new comment in your cohort")
  end

  def new_submission_comment(user, comment)
    @user = user
    @comment = comment
    mail(to: user.email, subject: "There's a new comment in your submission!")
  end

  def notify_cohort_new_comment(group, comment)
    if comment.commentable_type == "Assignment"
      group.each do |user|
        CommentMailer.new_comment(user, comment).deliver
      end
    else
      group.each do |user|
        CommentMailer.new_submission_comment(user, comment).deliver
      end
    end
  end

end