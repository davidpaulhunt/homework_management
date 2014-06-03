class WelcomeUserJob
  include SuckerPunch::Job

  def perform(user)
    UserMailer.your_account_created(user).deliver
  end

end