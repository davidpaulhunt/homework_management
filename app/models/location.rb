class Location < ActiveRecord::Base
  has_many :cohorts, dependent: :destroy


  after_create :format_attrs

  scope :courses, -> { joins.(:cohorts).joins(:courses).where()}

  def courses
    @courses = []
    self.cohorts.each do |cohort|
      @courses << cohort.course
    end
    @courses
  end

  def format_attrs
    self.city = self.city.titleize
    self.state = self.state.upcase
    self.save!
  end

  def where
    city + ", " + state
  end
end
