FactoryGirl.define do

  factory :assignment do
    title "A cool assignment"
    content "This is about dinosaurs!"
    association :cohort, factory: :cohort
    after(:build) do |assignment|
      assignment.cohort ||= FactoryGirl.build(:cohort)
    end
  end

end