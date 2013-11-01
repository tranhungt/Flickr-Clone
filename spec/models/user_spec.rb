require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  it "has a valid factory" do
    user.should be_valid
  end

  it "is invalid without an email" do
    user.email.should_not be_empty
  end

  it "is invalid without a password" do
    user.password.should_not be_empty
  end

  it "has a photostream" do
    user.photostream.should be_valid
  end
  

  it { should have_many(:photos) }
  it { should have_many(:favorites) }
  it { should have_many(:favorite_photos).through(:favorites) }
  it { should have_many(:collections) }
  it { should have_many(:collection_photos).through(:collections) }
  it { should have_many(:friendships) }
  it { should have_many(:friends).through(:friendships) }
  it { should have_many(:followers).through(:friendships) }
  it { should have_many(:friend_photos).through(:friends) }

end