class Course < ActiveRecord::Base
  has_many :cohorts

  after_create :format_attrs

  def format_attrs
    self.title = self.title.titleize
    self.save!
  end

end
