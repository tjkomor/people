# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

students = [
  {
    :last_name => "Adam",
    :first_name => "Magan",
    :image_url => "/images/students/gschool1/adam.jpg",
    :email_address => "Adam.dev89@gmail.com",
    :looking_for_description => "Adam has **accepted a position** with [thoughtbot](http://thoughtbot.com) in Stockholm.\n\nI seek to join a company that places emphasis on continous learning, pair programming and TDD. A developer centric organisation that places a lot of responsibility and trust in their developers.",
    :best_at => ['Test Driven Development', 'Clean Code', 'Problem Solving'],
    :looking_for => ["Continuous Learning", "Consultancy", "Great Culture"],
    :locations => ["West Midlands, UK", "London, UK"],
    :code => {
      :github => 'https://github.com/adam89',
      :project_1 => {
        :title => "Noshify - Multi-Tenant Restaurant Ordering Platform.",
        :description => "We inherited a legacy code base and extended it to support multi-tenancy. It was a software as a Service for restaurant owners I developed with two gSchool classmates.",
        :url => 'https://github.com/fluxusfrequency/fourth_meal',
        :what_to_look_for => ['High Test Coverage', 'Regression Tests', 'Multiple Permission Levels']
      },
      :project_2 => {
        :title => "Duolingo - Api Wrapper Gem",
        :description => "A wrapper gem for the duolingo api that was built by me as a side project.",
        :url => 'http://github.com/adam89/duolingo',
        :what_to_look_for => ['High Test Coverage', 'HTTP Requests VCR', 'Clean Code']
      },
      :resume => "To Be Uploaded Soon",
      :references => ['Jeff Casimir', 'Sean Griffin'],
      :other_notes => "My Blog: http://aspiring-programmer.herokuapp.com/"
    },
    :group => "gschool1"

  },

  {
    :last_name => "Barrett",
    :first_name => "Louisa",
    :image_url => "/images/students/gschool1/barrett.jpg",
    :email_address => "louisabarrett@gmail.com",
    :looking_for_description => "Louisa has **accepted a position** with [Mondo Robot](http://www.mondorobot.com/) in Boulder.\n\nI'm on the hunt for a great team building great products. I thrive in tight-knit, collaborative environments and love working with dedicated, driven teammates. I'm passionate about education, conservation, healthcare, design and great user experiences. I continually seek out ways to learn new skills and push myself outside of my comfort zone, and I take great pride in doing the best work possible.",
    :best_at => ['Pair programming', 'TDD', 'Attention to detail and love of well crafted code'],
    :looking_for => ["Continued learning and growth as a developer", 'Supportive team environment', "A blend of front and back-end responsibilities"],
    :locations => ["Denver, CO", "Boulder, CO", "San Francisco, CA", "Seattle, WA", "Portland, OR", "Austin, TX"],
    :code => {
      :github => 'https://github.com/LouisaBarrett',
      :project_1 => {
        :title => "Runline 2.0",
        :description => "This was a project in refactoring. As part of a two person team, we challenged ourselves to implement object oriented programming and single responsibility principles to extremes and dive deeply into OOP concepts. We focused on taking small steps, keeping our test suite running green, and creating a variety of service objects that adhere to SRP.",
        :url => 'https://github.com/LouisaBarrett/runline-2',
        :what_to_look_for => ['Test coverage', 'Objects with clearly defined responsibilities', 'Object Oriented Programming principles']
      },
      :project_2 => {
        :title => "FundIt - a fund-raising app",
        :description => "An in-process, solo project creating a fund-raising site built using Ruby, Rails and RSpec.",
        :url => 'http://github.com/LouisaBarrett/fundit',
        :what_to_look_for => ['Attention to MVC architecture']
      },
      :project_3 => {
        :title => "Command Query - Solutions to a series of kata-like tests practicing how objects change in Ruby.",
        :description => "This was a fun group of bite-sized, foundational Ruby problems to work through, ranging in difficulty from simple to tricky.",
        :url => 'https://github.com/LouisaBarrett/command-query_practice',
        :what_to_look_for => ['Consistency of solutions', 'Solid understanding of changing the state of an object']
      }
    },
    :resume => "http://f.cl.ly/items/2D2S2u0L0Z2B3x0o3X1Y/LouisaBarrett_resume.pdf",
    :references => ['Katrina Owen', 'Jay Zeschin', 'Michelle Wolf'],
    :group => "gschool1",
    :other_notes => "I'm a sucker for typography and all things designerdy."
  },

  {
    :last_name => 'Engelsted',
    :first_name => 'Katrina',
    :image_url => '/images/students/gschool1/engelsted.jpg',
    :email_address => 'katrina@engelsted.co',
    :skype_username => 'katrina.engelsted',
    :looking_for_description => "Katrina has **accepted a position** with the [National Park Service](http://nps.gov) in Denver.\n\nKatrina is looking for a collaborative, mentoring environment (preferably one that works with geospatial analytics and/or maps). She seeks a place that encourages transparency, communication, TDD and agile development.",
    :best_at => ['GeoJSON', 'Flexibility', 'Communication', 'Design'],
    :looking_for => ['Continuous Learning', 'Exposure to all things Javascript', 'Open Source', 'Encouraging, Fun Environment'],
    :locations => ['Denver, CO','Boulder, CO', 'Remote'],
    :code => {
      :github => 'http://github.com/MappingKat',
      :project_1 => {
        :title => 'Triptionary',
        :description => 'An application to share trip memories through social media. Practiced OAuth login and API integration with Twitter, Foursquare and Instagram. Parsed geojson for rendering dynamic maps.  Check it out:  www.triptionary.tk',
        :url => 'http://github.com/mappingkat/travelhub',
        :what_to_look_for => ['Heavy API integration', 'API endpoint at /api/v1', 'Incorporation of Twitter under models/status_api.rb', 'Mocking and stubbing for the tests in spec/jobs']
      },
      :project_2 => {
        :title => 'FreshFinder (work in progress)',
        :description => 'Multiple services integrated to provide and output farmers market data.  The app displays farmers markets locations and allows users to search for them by location and name.   See it live at: ',
        :url => 'https://github.com/freshfinder/frontend',
        :what_to_look_for => ['GeoJSON with MapBox and Leaflet.js',  'UI/UX', 'Multiple app integration']
      },
      :project_3 => {
        :title => 'Beary Hungry',
        :description => ' A multi-tenancy application for online restaurant ordering. This project took an existing code base that had many failing tests and broken functionality and built upon it. Explore it at: www.bearyhungry.tk',
        :url => 'http://github.com/mappingkat/bearlyhungry',
        :what_to_look_for => ["Email and SMS notification", "Caching and Indexing", "Test coverage on all added or refactored Features"]
      }
    },
    :resume => 'http://www.mappingkat.com/resume',
    :references => ['Jorge Téllez (Jumpstart Lab),  Kate Chapman (Humanitarian OpenStreetMap Team), Dai Yamamoto (Colgate University advisor)'],
    :other_notes => 'I am a passion driven person and want to use technology to improve the world.  Working abroad has taught me how effective certain apps can be in improving quality of life.  I also have a map fetish because I think that they are functional and beautiful.  What more could you want ;)',
    :group => 'gschool1'
  }
]

cohort = Cohort.where(:name => "1406").first_or_create

students.each do |student|
  person = Person.new
  person.first_name = student[:first_name]
  person.last_name = student[:last_name]
  person.image_url = student[:image_url]
  person.email_address = student[:email_address]
  person.looking_for = student[:looking_for_description]
  #person.best_at = student[:best_at]
  person.resume_url = student[:resume_url]
  person.cohort = cohort
  person.save!
end
