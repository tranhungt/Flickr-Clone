FactoryGirl.define do
  factory :photo do #|f|
    image do
      Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/default_profile.jpeg'), 'image/jpg')
    end
  end
end