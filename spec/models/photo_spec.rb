require 'spec_helper'

describe Photo do
  let(:photo) { FactoryGirl.create(:photo) }

  it "has a valid factory" do
    photo.should be_valid
  end

  it "should have image file" do
    photo.image.should_not be_nil
  end

  it { should belong_to(:photostream) }
  it { should have_many(:favorites) }
  it { should have_many(:photo_taggings) }
  it { should have_many(:tags).through(:photo_taggings)}
  it { should have_many(:favorites) }
  it { should have_many(:favorited_users).through(:favorites)}
  it { should have_many(:collections).through(:photo_collections) }
  it { should have_many(:collections) }

end