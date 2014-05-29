class PasswordResetsController < ApplicationController

  skip_filter :ensure_logged_in
  
  def new
  end

  def create
    if params[:email] == ""
      redirect_to new_password_reset_path, notice: "Email required."
    else
      @user = User.find_by_email(params[:email])
      if @user
        @user.send_password_reset
        redirect_to login_path, :notice => "Reset instructions sent!"
      else
        redirect_to new_password_reset_path, notice: "User not found."
      end
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    puts @user.inspect
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: "Password &crarr; 
        reset has expired."
    elsif @user.update_attributes(password_params)
      redirect_to new_session_path, notice: "Password has been reset."
    else
      render :edit
    end
  end

  private

  def password_params
    user = {}
    user[:password] = params[:password]
    user[:password_confirmation] = params[:password_confirmation]
    user
  end

end
