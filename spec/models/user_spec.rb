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
end