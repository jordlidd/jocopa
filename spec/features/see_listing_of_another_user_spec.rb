require 'spec_helper'

feature "see listing of another user" do

  before do
    user = FactoryGirl.create(:user)  

    
    visit '/'
    click_link 'List Your Thing'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link 'List Your Thing'
    fill_in "Title", with: "Example Listing"
    fill_in "Host", with: "John Doe"
    fill_in "Description", with: "An example listing, nothing more, nothing less. Used for testing purposes only."
    fill_in "Location", with: "Wawa"
    fill_in "Price", with: 25

    click_button "Create Listing"
    click_link 'Account'
    click_link 'Sign out'


  end

  scenario "Seeing listing details without being signed in" do
    click_link 'Show'
    expect(page).to have_content("Example Listing")
  end
end
