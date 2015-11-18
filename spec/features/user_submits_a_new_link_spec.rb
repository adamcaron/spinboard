require 'rails_helper'

RSpec.feature "User submits a new link", type: :feature do

  scenario "Logs in, creates link, sees link on page" do
    visit root_path
    click_link("Sign Up")
    fill_in "Username", with: "Adam"
    fill_in "Email", with: "adam@something.com"
    fill_in "Password", with: "123"
    fill_in "Confirm Password", with: "123"
    click_button("Create Account")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Links")
    expect(page).to have_content("Submit a Link")
    fill_in "Title", with: "My fav search engine"
    fill_in "Url", with: "https://google.com"
    click_button("Submit Link")

    expect(page).to have_content("My fav search engine")
    expect(page).to have_content("https://google.com")
  end
end