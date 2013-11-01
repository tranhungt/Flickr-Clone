require 'spec_helper'

describe "LoginUsers" do
  before(:each) {visit new_user_session_path}

  it "has email field" do 
    page.should have_content("Email")
  end

  it "has password field" do
    page.should have_content("Password")
  end

  it "login user with valid credentials" do
    user = FactoryGirl.create(:user)
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"
    page.should have_content("Recently Uploaded Photos")
  end
end
