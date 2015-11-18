require 'rails_helper'

RSpec.feature "User edits link", type: :feature do

  scenario "Logged in, enters valid url" do
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

    # Edit
    click_link("Edit")
    expect(current_path).to eq(edit_link_path(id: Link.last.id))
    expect(page).to have_content("Edit Link")
    fill_in "Title", with: "New Title!"
    fill_in "Url", with: "https://yahoo.com"
    click_button("Submit")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("New Title!")
    expect(page).to have_content("https://yahoo.com")
    expect(Link.last.title).to eq("New Title!")
    expect(Link.last.url).to eq("https://yahoo.com")
  end
end