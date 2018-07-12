User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

6.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

Business.create!(name:  "Example Business",
             city:  "Brooklyn",
             state: "NY",
             
             
             zipcode: "11243",
             address1: "900 7th Ave",
             address2: "800 6th Ave",
             phone: "7828899485",
             email: "example@railstutorial1.org",
             description: "We do Burgers and Fries")

6.times do |nn|
  name     = Faker::Name.name
  city     = Faker::Address.city
  state    = Faker::Address.state
  zipcode  = Faker::Address.zip_code
  address1 = Faker::Address.street_name
  address2 = Faker::Address.street_name
  phone    = Faker::PhoneNumber.phone_number
  email    = "example-#{nn+1}@railstutorial2.org"
  description = Faker::Company.catch_phrase
  
  
  Business.create!(name:        name,
                   city:        city,
                   state:       state,
                   zipcode:     zipcode,
                   address1:    address1,
                   address2:    address2,
                   phone:       phone,
                   email:       email,
                   description: description)
end

Category.create!(name: "Italian")

6.times do |i|
  
  name = Faker::Name.name
  
  Category.create!(name: name)
end

users = User.order(:created_at).take(6)
6.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.reviews.create!(content: content) }
end




# Following relationships
users = User.all
user  = users.first
following = users[2..6]
followers = users[3..5]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


