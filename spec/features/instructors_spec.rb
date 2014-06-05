require 'rails_helper'
include SpecTestHelper

feature "Instructor" do

  let(:user) { FactoryGirl.create(:instructor) }

  scenario "logging in" do
    login(user)
    current_path.should eq('/instructors')
  end

  scenario "adding an assignment" do
    login(user)
    add_an_assignment
    current_path.should eq('/instructors')
  end

  scenario "view an assignment" do
    login(user)
    add_an_assignment
    click_link "A cool assignment"
    current_path.should eq(assignment_path(Assignment.last))
  end

  scenario "edit an assignment" do
    login(user)
    add_an_assignment
    click_link "A cool assignment"
    current_path.should eq(assignment_path(Assignment.last))
    click_link "Edit Assignment"
    current_path.should eq(edit_assignment_path(Assignment.last))
    fill_in "assignment[title]", with: "Updated assignment title"
    click_button "Save Assignment"
    current_path.should eq(assignment_path(Assignment.last))
    Assignment.last.title.should eq("Updated assignment title")
  end

  # scenario "delete an assignment", js: true do
  #   background do
  #     User.make(email: 'instructor@email.com', password: 'password', type: "Instructor")
  #   end
  #   visit '/login'
  #   current_path.should eq("/login")
  #   within("form") do
  #     fill_in "email", with: "instructor@email.com"
  #     fill_in "password", with: "password"
  #   end
  #   click_button "Login"
  #   current_path.should eq('/instructors')
  #   add_an_assignment
  #   click_link "A cool assignment"
  #   current_path.should eq(assignment_path(Assignment.last))
  #   click_link "Delete Assignment"
  #   page.driver.accept_js_confirms!
  #   current_path.should eq('/instructors')
  # end

end