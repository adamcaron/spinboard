require 'rails_helper'

RSpec.feature "User deletes link", type: :feature do

  scenario "Link gets deleted" do
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

    # Delete
    click_link("Delete")
    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("My fav search engine")
    expect(page).to_not have_content("https://google.com")
    expect(Link.count).to be(0)
  end
end