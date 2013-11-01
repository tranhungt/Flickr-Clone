FactoryGirl.define do
  factory :user do |f|
    f.sequence(:email){|n| "foobar#{n}@example.com"}
    f.password "password"
  end
end