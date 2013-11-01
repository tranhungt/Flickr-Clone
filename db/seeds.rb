# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user2 = User.create!(:email => "user2@gmail.com", :password => "password")
photostream = user2.photostream
20.times do
  photo = photostream.photos.build(:title => "one", :saved => true)
  photo.image = File.open('app/assets/images/default_profile.jpeg')
  photo.save!
end

