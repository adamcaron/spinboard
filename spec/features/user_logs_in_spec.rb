require 'rails_helper'

RSpec.feature "User logs in", type: :feature do
  scenario "Unauthenticated user forced to login." do
    visit root_path

    expect(current_path).to eq("/login")
    expect(page).to have_content("Log In")
  end

  scenario "Unauthenticated user craetes accoutn" do
    visit root_path
    click_link("Sign Up")

    expect(page).to have_content("Create a new account")
    fill_in "Username", with: "Adam"
    fill_in "Password", with: "123"
    click_button("Create Account")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, Adam!")
    expect(page).to have_link("Logout")
  end
end