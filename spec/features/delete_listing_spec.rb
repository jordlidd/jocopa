# require 'spec_helper'

# feature "Deleting Listings" do

#   before do
#     user = FactoryGirl.create(:user)
#     listing = FactoryGirl.create(:listing)

#     visit '/'
#   end

#   scenario "deleting a listing" do

#     fill_in "Title", with: "Example Listing"
#     fill_in "Host", with: "John Doe"
#     fill_in "Description", with: "An example listing, nothing more, nothing less. Used for testing purposes only."
#     fill_in "Location", with: "Wawa"
#     fill_in "Price", with: 25

#     click_button "Create Listing"

#     expect(page).to have_content("Your listing has been created and will be reviewed for publishing shortly.")

#     within "#listing #author" do
#       expect(page).to have_content("Created by bruce@gotham.net")
#     end
#   end
# end
