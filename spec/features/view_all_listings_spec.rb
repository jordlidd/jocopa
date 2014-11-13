require 'spec_helper'

feature "View all listings" do

  before do
    user = FactoryGirl.create(:user)
    listing = FactoryGirl.create(:listing)

    visit '/listings'
    click_link 'Sign Up'
    fill_in "First name", with: "Jordan"
    fill_in "Last name", with: "Liddle"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create User"

    expect(page).to have_content("Welcome! You're officially part of the team.")
    
    click_link "See Listings"
    click_link "New Listing"

    fill_in "Title", with: "Test Listing"
    fill_in "Host", with: "Jordan Liddle"
    fill_in "Description", with: "Testing out a testy test test for this test posting on the test website for this test test."
    fill_in "Location", with: "Wawa"
    fill_in "Price", with: 24

    click_button "Create Listing"

    expect(page).to have_content("Test Listing")

    click_link 'Signing out'

  end

end
