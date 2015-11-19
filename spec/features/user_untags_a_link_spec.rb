require 'rails_helper'

RSpec.feature "User untags a link", type: :feature do

  scenario "Link no longer has that tag" do
    # Log In
    visit root_path
    click_link("Sign Up")
    fill_in "Username", with: "Adam"
    fill_in "Email", with: "adam@something.com"
    fill_in "Password", with: "123"
    fill_in "Confirm Password", with: "123"
    click_button("Create Account")

    # Create Link
    fill_in "Title", with: "My fav search engine"
    fill_in "Url", with: "https://google.com"
    click_button("Submit Link")
    Link.last.tags << Tag.create!(title: "Sometag")

    # Un-tag
    visit root_path
    expect(page).to have_content("Sometag")
    click_link("X")

    expect(page).not_to have_content("Sometag")
  end
end