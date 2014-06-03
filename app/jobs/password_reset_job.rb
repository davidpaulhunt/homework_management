class PasswordResetJob
  include SuckerPunch::Job

  def perform(user)
    UserMailer.reset_user_password(user).deliver
  end

end