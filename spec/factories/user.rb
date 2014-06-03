FactoryGirl.define do

  factory :user do
    first_name "first"
    last_name "last"
    email "user@email.com"
    password "password"
    password_confirmation "password"
  end


  factory :student, class: Student, parent: :user do
    email "student@email.com"
    type "Student"
  end

  factory :admin, class: Admin, parent: :user do
    email "admin@email.com"
    type "Admin"
  end

  factory :instructor, class: Instructor, parent: :user do
    email "instructor@email.com"
    type "Instructor"

    after(:build) do |instructor|
      instructor.cohort ||= FactoryGirl.build(:cohort, :instructor => instructor)
    end

  end

  factory :teaching_assistant, class: User, parent: :user do
    email "ta@email.com"
    type "TeachingAssistant"
  end

end