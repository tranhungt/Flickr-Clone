require 'spec_helper'

describe "SignUpUsers" do
  before(:each) {visit new_user_registration_path}

  it "has link to sign in page" do
    page.should have_content("Sign in")
  end

  it "directs to sign in page when link is clicked" do
    click_link "Sign in"
    current_path.should == new_user_session_path
  end

  it "has forgot password link" do
    page.should have_content("Sign in")
  end

  it "directs to forgotten password page when link is clicked" do
    click_link "Forgot your password?"
    current_path.should == new_user_password_path
  end

  it "has email field" do 
    page.should have_content("Email")
  end

  it "has password field" do
    page.should have_content("Password")
  end

  it "has password confirmation field" do
    page.should have_content("Password confirmation")
  end

  it "signs up with valid credentials" do
    email = "test@example.com"
    password = "password"
    fill_in "Email", :with => email
    fill_in "Password", :with => password
    fill_in "Password confirmation", :with => password
    click_button "Sign up"
    page.should have_content("Recently Uploaded Photos")
  end

  it "prompts error if email is already taken" do
    user = FactoryGirl.create(:user)
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    fill_in "Password confirmation", :with => user.password
    click_button "Sign up"
    page.should have_content("Email has already been taken")
  end


end
