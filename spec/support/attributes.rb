def project_attributes(override = {})
  {
    name: "Start-Up Project-A",
    description: "A description of a start-up project-A",
    team_members: 'karim, riham, mo, nahla, haya, omar.',
    image_file_name: 'project-a.png',
    target_pledge_amount: 100.00,
    pledging_ends_on: 30.day.from_now,
    website: "http://project-a.com"
  }.merge(override)
end