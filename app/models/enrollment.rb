class Enrollment < ActiveRecord::Base
  belongs_to :student, dependent: :destroy
  belongs_to :cohort, dependent: :destroy
end
