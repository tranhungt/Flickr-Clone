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

  it "re renders page with invalid credentials" do
    user = FactoryGirl.create(:user)
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "wrong password"
    click_button "Sign in"
    current_path.should == new_user_session_path
  end

  it "should link to sign up page" do
    click_link "Sign up"
    page.should have_content("Sign up")
  end

  it "directs to sign up page when clicked" do
    click_link "Sign up"
    current_path.should == new_user_registration_path
  end

  it "has forgot password link" do
    page.should have_content("Sign in")
  end

  it "directs to forgotten password page when link is clicked" do
    click_link "Forgot your password?"
    current_path.should == new_user_password_path
  end

end
