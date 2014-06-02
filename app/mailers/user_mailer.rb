class UserMailer < ActionMailer::Base
  default from: "tiyhomework@gmail.com"

  # def self.new_yard_sale_message_to_all(group, yard_sale)
  #   group.each do |user|
  #     UserMailer.new_yard_sale_message(user, yard_sale).deliver
  #   end
  # end

  def your_account_created(user)
    @user = user
    mail(to: user.email, subject: "Thanks for joining The Iron Yard :)")
  end

  def reset_user_password(user)
    @user = user
    mail(to: user.email, subject: "Your password reset request from The Iron Yard")
  end

  def new_submission_created(user, submission)
    @student = user
    @submission = submission
    notify_instructor_new_submission(user, submission)
    mail(to: user.email, subject: "Submission received! :)")
  end

  def notify_instructor_new_submission(user, submission)
    @student = user
    @submission = submission
    @cohort = submission.assignment.cohort
    @instructor = @cohort.instructor
    mail(to: @instructor.email, subject: "New submission by #{@student.full_name}in #{@cohort.listing}")
  end

end