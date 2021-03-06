class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :ensure_logged_in

  helper_method :current_user, :is_admin, :is_instructor, :choose_path, :get_users

  def ensure_logged_in
    if current_user.nil?
      redirect_to login_path
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def choose_path(user)
    case user.type
    when "Admin"
      redirect_to admins_path
    when "Instructor"
      redirect_to instructors_path
    when "TeachingAssistant"
      redirect_to teaching_assistants_path
    when "Student"
      redirect_to students_path
    end
  end

  def get_users(user)
    case user.type
    when "Admin"
      User.all
    when "Instructor", "TeachingAssistant"
      if user.cohort then user.cohort.students else users = [] end
    end
  end

end
