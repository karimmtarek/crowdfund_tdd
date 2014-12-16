require 'rails_helper'

describe "Creating a new pledge" do

  it "saves the pledge if it's valid" do
    project = Project.new(project_attributes)
    project.save

    visit project_url(project)

    click_link 'Pledge!'

    expect(current_url).to eq(new_project_pledge_url(project))

    fill_in "Name",  with: "Joe Smith"
    fill_in "Email", with: "joe@gmail.com"
    select  "100", :from => "pledge_amount"
    fill_in "Comment", with: "Count me in!"

    click_button 'Make Pledge!'

    expect(current_url).to eq(project_pledges_url(project))
    expect(page).to have_text("Thanks for your pledge, we appreciate it.")
    expect(page).to have_text("Joe Smith")
    expect(page).to have_text("$100.00")
  end

  it "does not save the pledge if it's invalid" do
    project = Project.create(project_attributes)

    visit new_project_pledge_url(project)

    expect {
      click_button 'Make Pledge!'
    }.not_to change(Pledge, :count)

    expect(page).to have_text('error')
  end

end