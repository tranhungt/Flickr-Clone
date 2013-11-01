FactoryGirl.define do
  factory :photo do |f|
    f.image File.open('app/assets/images/default_profile.jpeg')
  end
end