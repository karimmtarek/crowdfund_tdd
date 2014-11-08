require "rails_helper"

describe "Viewing an individual project" do
  it "shows project details" do
    project = Project.create(project_attributes(target_pledge_amount: 100.00))

    visit project_url(project)

    expect(page).to have_text(project.name)
    expect(page).to have_text(project.description)
    expect(page).to have_text(project.website)
    expect(page).to have_text("$100.00")
  end

  it "shows the number of days remaining if the pledging end date is in the future" do
    project = Project.create(project_attributes)

    visit project_url(project)

    expect(page).to have_text(project.pledging_ends_on)
  end

  it "shows 'All Done!' if the pledging end date is in the past" do
    project = Project.create(project_attributes(pledging_ends_on: "2014-10-10"))

    visit project_url(project)

    expect(page).to have_text("All Done!")
  end
end