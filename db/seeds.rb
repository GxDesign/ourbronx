# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Package.create([
    {title: "Package 1", description: "Sample package1", price: 1000},
    {title: "Package 2", description: "Sample package2", price: 10000},
    {title: "Package 3", description: "Sample package3", price: 15000},
    {title: "Package 4", description: "Sample package4", price: 1500000}
  ])
