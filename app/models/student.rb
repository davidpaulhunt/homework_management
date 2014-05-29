class Student < User

  has_many :enrollments, dependent: :destroy
  has_many :cohorts, through: :enrollments
  has_many :submissions, dependent: :destroy


end