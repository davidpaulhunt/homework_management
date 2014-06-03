FactoryGirl.define do

  factory :assignment do
    title "build facebook"
    due_date Date.today + 1
    association :cohort, factory: :cohort
    after(:build) do |assignment|
      assignment.cohort ||= FactoryGirl.build(:cohort)
    end
  end

end
