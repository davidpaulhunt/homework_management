class SessionsController < ApplicationController

  skip_filter :ensure_logged_in
  before_filter :in_session, only: :new

  def new
  end

  def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    
    if user
      session[:user_id] = user.id
      choose_path(user)
    else
      flash.now.alert = "invalid email or pw"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "You logged out!"
  end

  private

  def in_session
    if current_user
      redirect_to users_path
    end
  end

  
end
