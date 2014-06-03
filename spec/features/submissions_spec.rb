require 'rails_helper'
include SpecTestHelper


feature "making submissions" do
  let(:instructor) { FactoryGirl.create(:instructor) }
  let(:student) { FactoryGirl.create(:student) }

  # let(:admin) { FactoryGirl.create(:admin) }
  # let(:cohort) { FactoryGirl.create(:cohort) }
  # let(:instructor) { FactoryGirl.create(:instructor) }
  context "submitting an assignment" do

    scenario "instructor submits an assignment" do
      #change to be more behavioral testing; might want to move these too
      login(instructor)
      expect{

        add_an_assignment

      }.to change(Assignment, :count).by(1)
    end

    scenario "student joins a cohort" do
      #change to be more behavioral testing
      cohort = instructor.cohort
      expect{
        cohort.students << student
      }.to change(cohort.students, :count).by(1)
    end

  end

  context "(making submissions) to an assignment" do

    before(:each) do
      login(instructor)
      add_an_assignment
      logout(instructor)
    end

    scenario "guest user should not be able to view assignment" do
      visit assignment_path(Assignment.last)
      current_path.should eq('/login')
    end

    scenario "student views an assignment" do
      login(student)
      visit assignment_path(Assignment.last)
      page.should have_content "This is about dinosaurs!"
    end

    scenario "guest user should not be able to view assignment page" do
      visit assignment_path(Assignment.last)
      current_path.should eq('/login')
    end

    scenario "student views assignment page" do
      login(student)
      visit assignment_path(Assignment.last)
      current_path.should eq assignment_path(Assignment.last)
    end

    scenario "submission page: guest user should not be able to view content of homework" do
      login(student)
      visit assignment_path(Assignment.last)
      add_a_submission
      logout(student)
      visit submission_path(Submission.last)
      current_path.should eq('/login')
    end

    scenario "submission page: student submits content of homework" do
      login(student)
      visit assignment_path(Assignment.last)
      add_a_submission
      current_path.should eq assignment_path(Assignment.last)
    end

    scenario "assignment page buttons before submission" do
      login(student)
      visit assignment_path(Assignment.last)
      page.should have_content "Complete Assignment"
    end

    scenario "assignment page buttons after submission" do
      login(student)
      visit assignment_path(Assignment.last)
      add_a_submission
      page.should have_content "Edit My Submission"
    end

    scenario "assignment page buttons before submission" do
      login(student)
      visit assignment_path(Assignment.last)
      page.should_not have_content "Edit My Submission"
    end

    scenario "assignment page buttons after submission" do
      login(student)
      visit assignment_path(Assignment.last)
      add_a_submission
      page.should_not have_content "Complete Assignment"
    end

  end

end