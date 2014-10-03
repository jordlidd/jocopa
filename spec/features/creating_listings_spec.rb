require 'spec_helper'

feature "Creating Listings" do

  before do
    user = FactoryGirl.create(:user)

    visit '/'
    click_link "List Your Thing"
    message = "You need to log in or sign up before continuing."
    expect(page).to have_content(message)

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    click_link 'See Listings'
    click_link 'New Listing'
  end

  scenario "Creating a new listing" do
    fill_in "Title", with: "Example Listing"
    fill_in "Host", with: "John Doe"
    fill_in "Description", with: "An example listing, nothing more, nothing less. Used for testing purposes only."
    fill_in "Location", with: "Wawa"
    fill_in "Price", with: 25

    click_button "Create Listing"

    expect(page).to have_content("Your listing has been created and will be reviewed for publishing shortly.")

    within "#ticket #author" do
      expect(page).to have_content("created by #{user.email}")
    end
  end
end
