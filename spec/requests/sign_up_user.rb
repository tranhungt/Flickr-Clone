require 'spec_helper'

describe "SignUpUsers" do
  before(:each) {visit new_user_session_path}

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
  end

end
