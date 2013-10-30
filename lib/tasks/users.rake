namespace :users do
  desc "Setup example user"
  task :create_sample => :environment do
    raise "Cant create sample user in #{Rails.env}" if Rails.env.production?
    u = User.create! username: 'hung', email: 'hung@gmail.com', password: 'password'
    puts "Created #{u.id} - #{u.username}"
  end
end