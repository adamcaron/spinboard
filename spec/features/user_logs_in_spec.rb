require 'rails_helper'

RSpec.feature "User logs in", type: :feature do
  scenario "Unauthenticated user forced to login." do
    visit root_path

    expect(current_path).to eq("/login")
    expect(page).to have_content("Log In")
  end

  scenario "Unauthenticated user creates account" do
    visit root_path
    click_link("Sign Up")

    expect(page).to have_content("Create a new account")
    fill_in "Username", with: "Adam"
    fill_in "Email", with: "adam@something.com"
    fill_in "Password", with: "123"
    fill_in "Confirm Password", with: "123"
    click_button("Create Account")

    expect(User.count).to eq(1)
    expect(User.last.email).to eq("adam@something.com")
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, Adam!")
    expect(page).to have_link("Logout")
  end

  scenario "Unauthenticated cannot sign in" do
    visit root_path
    fill_in "Email", with: "adam@something.com"
    fill_in "Password", with: "123"

    expect(current_path).to eq('/login')
  end

  scenario "User signs up with bad credentials" do
    visit root_path
    click_link("Sign Up")

    expect(page).to have_content("Create a new account")
    fill_in "Username", with: ""
    fill_in "Email", with: "adam@something.com"
    fill_in "Password", with: "123"
    fill_in "Confirm Password", with: "123"
    click_button("Create Account")

    expect(current_path).to eq(users_path)
  end
end