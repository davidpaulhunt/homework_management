FactoryGirl.define do

  factory :cohort do
    start_date "2014-06-05"
    association :instructor, factory: :user, type: "Instructor"
    after(:build) do |cohort|
      cohort.location ||= FactoryGirl.build(:location)
      cohort.course ||= FactoryGirl.build(:course)
      cohort.instructor ||= FactoryGirl.build(:instructor)
    end
  end

end