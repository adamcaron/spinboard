require 'rails_helper'

RSpec.feature "User updates status of link", type: :feature do

  describe "Clicks button" do
    it "Changes link from 'Unread' to 'Read' and back again", js: true do
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

      # Change status
      expect(page).to have_content("Mark as Read")
      expect(Link.last.read).to be(false)

      click_button("Mark as Read")
      expect(Link.last.read).to be(true)
      expect(page).to have_content("Mark as Unread")
      expect(page).not_to have_content("Mark as Read")

      # Re-navigate to page
      visit root_path

      expect(page).to have_content("Mark as Unread")
      expect(page).not_to have_content("Mark as Read")

      # Change status again
      click_button("Mark as Unread")
      expect(Link.last.read).to be(false)
      expect(page).to have_content("Mark as Read")
      expect(page).not_to have_content("Mark as Unread")
    end
  end
end