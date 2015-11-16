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
  User.create!([
  {
    email: "g.r.martinez49@gmail.com",
    password: "password123",
    first_name: "Giancarlo",
    last_name: "Martinez",
    avatar_file_name: "giancarlo_index_profile.jpg",
    avatar_content_type: "image/jpeg",
    avatar_file_size: 82825,
    avatar_updated_at: "2015-10-19 17:56:49"
  },
  {
    email: "sylvia@flatironschool.com",
    password: "password123",
    first_name: "Sylvia",
    last_name: "Dolmo",
    avatar_file_name: "sylvia.jpg",
    avatar_content_type: "image/jpeg",
    avatar_file_size: 567400,
    avatar_updated_at: "2015-10-20 13:48:15"
  },
  {
    email: "damian@flatironschool.com",
    password: "password123",
    first_name: "Damian",
    last_name: "Lajara",
    avatar_file_name: "damian_lajara_profile.jpg",
    avatar_content_type: "image/jpeg",
    avatar_file_size: 667123,
    avatar_updated_at: "2015-10-20 14:01:29"
  }
])

Project.create!([
  {
    user_id: User.find_by(first_name: "Giancarlo").id,
    title: "Thanksgiving Cooking Workshop",
    summary: "Get out your apron and lets put on a Thanksgiving Cooking Workshop with Mothers On The Move! ",
    mentorship_req: "Most of us know how to cook a mean meal but we're expecting over 100 participants! We're seeking a mentor who can guide us through logistics.",
    resources_req: "Any canned food donations are greatly welcome.",
    services_req: "We need 20 volunteers to help us with outreach, setup and distribute food.",
    published: true,
    approved: true,
    image_file_name: "cooking.png",
    image_content_type: "image/png",
    image_file_size: 1737300,
    image_updated_at: "2015-10-20 03:26:05"
  },
  {
    user_id: User.find_by(first_name: "Sylvia").id,
    title: "Winter Blanket Distribution",
    summary: "There are over 14k homeless families in NYC and a cold winter up ahead. Lets distribute blankets and sweaters before the winter chill hits!",
    mentorship_req: "",
    resources_req: "Please donate any sweaters or blankets that are in good condition.",
    services_req: "We would like to provide an informational session to our volunteers to ensure awareness and sensitivity.\r\n\r\nWe also need a couple 2-4 drivers.",
    published: true,
    approved: true,
    image_file_name: "homeless.jpg",
    image_content_type: "image/jpeg",
    image_file_size: 80769,
    image_updated_at: "2015-10-20 03:54:19"
  },
  {
    user_id: User.find_by(first_name: "Damian").id,
    title: "Lets Open a CodeSchool for girls",
    summary: "Women are highly underrepresented in tech. Lets introduce young bronx girls to programming and build tech leadership.",
    mentorship_req: "Seeking a business mentor.",
    resources_req: "Seeking a space to rent in the Bronx, one day a week, 3 hrs between 6 and 10.",
    services_req: "Seeking 2 - 4 volunteer instructors.\r\n",
    published: true,
    approved: true,
    image_file_name: "girlscode.jpg",
    image_content_type: "image/jpeg",
    image_file_size: 285147,
    image_updated_at: "2015-10-20 13:58:07"
  }
])
