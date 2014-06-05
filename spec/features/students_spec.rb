require 'rails_helper'
include SpecTestHelper

feature "Student" do

  let(:user) { FactoryGirl.create(:student) }

  # scenario "view an assignment" do
  #   login(user)
  #   click_link "A cool assignment"
  #   current_path.should eq(assignment_path(Assignment.last))
  # end

end