class NotificationsController < ApplicationController

  def new
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      redirect_to :back
    end
  end

  def index
    @notifications = current_user.notifications.active
  end

  def show
  end

  def destroy
  end

  private

end