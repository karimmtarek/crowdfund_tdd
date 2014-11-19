require "rails_helper"

describe "Viewing the list of projects" do
  it "shows three project names" do
    project1 = Project.create(name: "Start-Up Project-A",
               description: "A description of a start-up project-A",
               image_file_name: 'project-a.png',
               target_pledge_amount: 100.00,
               pledging_ends_on: 30.day.from_now,
               website: "http://project-a.com")

    project2 = Project.create(name: "Start-Up Project-B",
               description: "A description of a start-up project-B",
               target_pledge_amount: 99.00,
               pledging_ends_on: 45.day.from_now,
               website: "http://project-b.com")

    project3 = Project.create(name: "Start-Up Project-C",
               description: "A description of a start-up project-C",
               target_pledge_amount: 175.00,
               pledging_ends_on: 60.day.from_now,
               website: "http://project-c.com")

    visit projects_path

    expect(page).to have_text('3 Projects')
    expect(page).to have_text(project1.name)
    expect(page).to have_text(project2.name)
    expect(page).to have_text(project3.name)

    expect(page).to have_text(project1.description[1..10])
    expect(page).to have_selector("img[src$='#{project1.image_file_name}']")
    expect(page).to have_text(project1.pledging_ends_on)
    expect(page).to have_text(project1.website)
    expect(page).to have_text("$100.00")
  end

  it "does not show a project that is no longer accepting pledges" do
    projectx = Project.create(name: "Project-X",
               description: "A description of a start-up project-X",
               target_pledge_amount: 175.00,
               pledging_ends_on: "2014-10-10",
               website: "http://project-x.com")

    visit projects_path

    expect(page).not_to have_text(projectx.name)
  end

end