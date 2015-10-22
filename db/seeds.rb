# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cause.create!([
    {
      title: "Code Schools",
      description: "Are you passionate technology but lack the funds for taking the step forward into the tech world? Have you ever found coding interesting, but had no means of how to start? Aid us in funding this campaign for people just like you. We're here to help you take that step forward.",
      goal: 300000,
      funded: 0,
      limit: 10
    },
    {
      title: "Child Care",
      description: "Do you want to make a difference in the world by contributing to the tech community, but don't find yourself with the needed time or resources due to taking care of children? We're here to help you by giving you a chance to make a difference. There should be nothing stopping you from achieving your goals.",
      goal: 100000,
      funded: 0, limit: 15
    },
    {
      title: "Business Management",
      description: "Want to create the next big startup, but feel lost on how to go about achieving that goal? Do you have awesome projects, but no way to showcase it? We're here to help you from the ground up by helping you develop the soft skills and business skills needed to create something exciting.",
      goal: 210000,
      funded: 0,
      limit: 25
    },
  ])
