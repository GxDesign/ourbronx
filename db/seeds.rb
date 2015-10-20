# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cause.create([
    {title: "African American Men", description: "A scholarship for young african american men who cannot afford to go to college", goal: 1000, funded: 500, limit: 10},
    {title: "Women in code", description: "A scholarship for woman to encourage them to start learning computer science", goal: 4000, funded: 1500, limit: 15},
    {title: "Latinos in tech", description: "A scholarship for all of those latino's who cannot afford an education", goal: 8000, funded: 3500, limit: 25},
    {title: "Disability in tech", description: "A scholarship for people with disabilities", goal: 15000, funded: 8500, limit: 35}
  ])
