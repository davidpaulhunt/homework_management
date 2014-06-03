module SpecTestHelper   

  def login(user)
    visit '/login'
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Login"
  end

  def logout(user)
    visit '/'
    click_link "Logout"
  end

  def add_a_location
    click_link "New Location"
    fill_in "location[city]", with: "Atlanta"
    fill_in "location[state]", with: "GA"
    click_button "Save Location"
  end

  def add_a_course
    click_link "New Course"
    fill_in "course[title]", with: "Rails"
    fill_in "course[technologies]", with: "Ruby, Sinatra, git, javascript"
    click_button "Save Course"
  end

  def add_an_assignment
    click_link "Add an Assignment"
    fill_in "assignment[title]", with: "A cool assignment"
    fill_in "assignment[content]", with: "This is about dinosaurs!"
    click_button "Save Assignment"
  end

  def add_a_submission
    click_link "Complete Assignment"
    fill_in "submission[content]", with: "My awesome work!"
    click_button "Submit"
  end

end