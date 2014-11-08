# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.create!([
  {
    name: "Start-Up Project-A",
    description: "A description of a start-up project-A",
    target_pledge_amount: 100.00,
    pledging_ends_on: 30.day.from_now,
    website: "http://project-a.com"
  },
  {
    name: "Start-Up Project-B",
    description: "A description of a start-up project-B",
    target_pledge_amount: 99.00,
    pledging_ends_on: 45.day.from_now,
    website: "http://project-b.com"
  },
  {
    name: "Start-Up Project-C",
    description: "A description of a start-up project-C",
    target_pledge_amount: 175.00,
    pledging_ends_on: 60.day.from_now,
    website: "http://project-c.com"
  },
  {
    name: "Start-Up Project-D",
    description: "A description of a start-up project-D",
    target_pledge_amount: 55.00,
    pledging_ends_on: '2013-10-10',
    website: "http://project-d.com"
  }
])