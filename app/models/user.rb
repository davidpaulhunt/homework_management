class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :type

  has_many :comments
  has_many :notifications, dependent: :destroy

  after_create :welcome_user

  scope :admins, -> { where(type: 'Admin') }
  scope :instructors, -> { where(type: 'Instructor') }
  scope :teaching_assistants, -> { where(type: 'TeachingAssistant') }
  scope :students, -> { where(type: 'Student') }

  def welcome_user
    WelcomeUserJob.new.async.perform(self)
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    PasswordResetJob.new.async.perform(self)
  end

  def full_name
    first_name.capitalize + " " + last_name.capitalize
  end

  private

  # def generate_temp_password
  #   @temp = SecureRandom.urlsafe_base64(6)
  # end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64(8)
    end while User.exists?(column => self[column])
  end
  
end
