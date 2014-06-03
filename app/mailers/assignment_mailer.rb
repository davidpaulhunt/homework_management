class AssignmentMailer < ActionMailer::Base
  default from: "tiyhomework@gmail.com"

  def new_assignment(user, assignment)
    @user = user
    @assignment = assignment
    mail(to: user.email, subject: "Your instructor has posted a new assignment in your cohort")
  end

  def notify_cohort_new_assignment(group, assignment)
    group.each do |user|
      AssignmentMailer.new_assignment(user, assignment).deliver
    end
  end

end