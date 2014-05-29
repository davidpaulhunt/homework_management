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

end