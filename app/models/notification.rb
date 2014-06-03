class Notification < ActiveRecord::Base

  include Workflow

  workflow do
    state :new do
      event :review, transitions_to: :reviewed
    end
    state :reviewed
  end

  belongs_to :user
  belongs_to :notifieable, polymorphic: true

  after_create :new_notification

  attr_accessor :mark_reviewed
  scope :active, -> { with_new_state }

  def new_notification
  end

  def load_notifieable
    id = self.notifieable_id
    resource = self.notifieable_type.constantize
    resource.find(id)
  end

  def active
    notifications.with_new_state
  end

  def self.mark_reviewed(notifieable_id, current_user_id)
    @user = User.find(current_user_id)
    @notes = @user.notifications.active.where(notifieable_id: notifieable_id)
    @notes.each do |note|
      note.review!
      note.save
    end
  end

end