module UsersHelper

  def user_types
    user_types = ["Admin", "Instructor", "TeachingAssistant", "Student"]
  end

  def sti_user_path(type = "user", user = nil, action = nil)
    send "#{format_sti(action, type, user)}_path", user
  end

  def format_sti(action, type, user)
    action || user ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end

  def my_submission(assignment_id)
    @my_submission = current_user.get_my_submission(assignment_id).first
  end

end
