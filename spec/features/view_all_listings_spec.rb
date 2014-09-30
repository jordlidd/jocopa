require 'spec_helper'

feature "View all listings" do

  before do
    FactoryGirl.create(:user, first_name: "John", last_name: "Doe", email: "john@doe.com", city: "Wawa")

    visit '/'
    click_link "Show"
    click_link "See Listings"
    click_link "New Listing"
  end

  scenario "Creating a new listing" do
    fill_in "Title", with: "Example Listing"
    fill_in "Host", with: "John Doe"
    fill_in "Description", with: "An example listing, nothing more, nothing less. Used for testing purposes only."
    fill_in "Location", with: "Wawa"
    fill_in "Price", with: 25

    click_button "Create Listing"

    visit '/listings'
    expect(page).to have_content("Example Listing John Doe")
  end
end
