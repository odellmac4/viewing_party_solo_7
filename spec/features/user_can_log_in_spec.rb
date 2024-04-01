require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create(name: "Odell", email: "odell@odell.com", password: "test", password_confirmation: "test")

    visit root_path

    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: "odell@odell.com"
    fill_in :password, with: "test"

    click_on "Log In"

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content("Odell's Dashboard")
  end

  it "cannot log in with bad credentials" do
    user = User.create(name: "Odell", email: "odell@odell.com", password: "test", password_confirmation: "test")
  
    visit login_path
    
  
    fill_in :email, with: "odell@odell.com"
    fill_in :password, with: "incorrect password"
  
    click_on "Log In"
  
    expect(current_path).to eq(login_path)
  
    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end