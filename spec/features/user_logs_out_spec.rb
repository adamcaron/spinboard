require 'rails_helper'

RSpec.feature "User logs out", type: :feature do
  scenario "Signed in user signs out." do
    visit root_path
    click_link("Sign Up")

    expect(page).to have_content("Create a new account")
    fill_in "Username", with: "Adam"
    fill_in "Email", with: "adam@something.com"
    fill_in "Password", with: "123"
    fill_in "Confirm Password", with: "123"
    click_button("Create Account")

    click_link("Logout")

    expect(current_path).to eq('/login')
  end
end