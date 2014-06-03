module ApplicationHelper

  def time_since(comment)
    if comment.user
      "- about " + distance_of_time_in_words(comment.created_at, Time.now) + " ago by " + comment.user.full_name + "."
    else
      "- about " + distance_of_time_in_words(comment.created_at, Time.now) + " ago."
    end
  end

  def choose_notification_path(note)
  end

end
