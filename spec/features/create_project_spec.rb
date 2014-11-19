require 'rails_helper'

describe "Creating a new project" do

  it "saves the project and shows the new project's details" do
    visit projects_url

    click_link 'Add New Project'

    expect(current_path).to eq(new_project_path)

    fill_in "Name", with: 'New Project Name'
    fill_in "Description", with: 'Some description'
    fill_in "Target pledge amount", with: '5000'
    # select (Time.now.year + 1).to_s, :from => "project_pledging_ends_on_1i"
    # fill_in "Pledging ends on", with: '2015-01-01'
    fill_in "Website", with: 'www.xoxo.com'
    fill_in "Team members", with: 'Lots of good people.'
    fill_in "Image file name", with: 'project.gif'

    click_button 'Create Project'

    expect(current_path).to eq(project_path(Project.last))

    expect(page).to have_text('New Project Name')

  end

end