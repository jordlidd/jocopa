require 'spec_helper'

feature 'Signing Up' do
  scenario 'Successful sign up' do
    visit '/'
    click_link 'Sign Up'
    fill_in "First name", with: "Jordan"
    fill_in "Last name", with: "Liddle"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create User"

    expect(page).to have_content("Welcome! You're officially part of the team.")
  end
end

