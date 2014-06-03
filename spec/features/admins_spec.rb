require 'rails_helper'
include SpecTestHelper

feature "Admin" do

  let(:user) { FactoryGirl.create(:admin) }

  scenario "logging in" do
    login(user)
    current_path.should eq('/admins')
  end

  scenario "adding a location" do
    login(user)
    click_link "New Location"
    fill_in "location[city]", with: "Atlanta"
    fill_in "location[state]", with: "GA"
    click_button "Save Location"
    current_path.should eq('/admins')
  end

  scenario "editing a location" do
    login(user)
    add_a_location
    click_link "Atlanta, GA"
    fill_in "location[city]", with: "Athens"
    click_button "Save Location"
    current_path.should eq('/admins')
    page.should have_content "Athens, GA"
  end

  scenario "deleting a location" do
    login(user)
    click_link "New Location"
    fill_in "location[city]", with: "Atlanta"
    fill_in "location[state]", with: "GA"
    click_button "Save Location"
    current_path.should eq('/admins')
    Location.all.count.should > 0
    click_link "X"
    current_path.should eq('/admins')
    Location.all.count.should eq(0)
  end

  scenario "adding a course" do
    login(user)
    click_link "New Course"
    fill_in "course[title]", with: "Rails"
    fill_in "course[technologies]", with: "Ruby, Sinatra, git, javascript"
    click_button "Save Course"
    current_path.should eq('/admins')
  end

  scenario "editing a course" do
    login(user)
    add_a_course
    click_link "Rails"
    fill_in "course[title]", with: "Android"
    click_button "Save Course"
    current_path.should eq('/admins')
    page.should have_content "Android"
  end

  scenario "deleting a course" do
    login(user)
    click_link "New Course"
    fill_in "course[title]", with: "Rails"
    fill_in "course[technologies]", with: "Ruby, Sinatra, git, javascript"
    click_button "Save Course"
    current_path.should eq('/admins')
    Course.all.count.should > 0
    click_link "X"
    current_path.should eq('/admins')
    Course.all.count.should eq(0)
  end

  scenario "adding a cohort" do
    login(user)
    add_a_location
    add_a_course
    click_link "New Cohort"
    click_button "Save Cohort"
    current_path.should eq('/admins')
  end

  scenario "deleting a cohort" do
    login(user)
    add_a_location
    add_a_course
    click_link "New Cohort"
    click_button "Save Cohort"
    current_path.should eq('/admins')
    Cohort.all.count.should > 0
    page.find("#cohorts").click_link "X"
    current_path.should eq('/admins')
    Cohort.all.count.should eq(0)
  end

  scenario "logging out" do
    login(user)
    click_link "Logout"
    current_path.should eq('/login')
  end

  scenario "edit profile" do
    login(user)
    click_link "Edit Profile"
    current_path.should eq(edit_user_path(user))
    fill_in "admin[first_name]", with: "Bob"
    click_button "Submit"
    current_path.should eq('/admins')
    User.last.first_name.should eq('Bob')
  end

end