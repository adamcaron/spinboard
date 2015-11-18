require 'rails_helper'

RSpec.feature "User logs in", type: :feature do
  scenario "Unauthenticated user forced to login." do
    visit root_path

    expect(current_path).to eq('/login')
    expect(page).to have_content('Please Log In')
  end
end