require 'spec_helper'

feature 'Profile page' do
  scenario 'viewing a profile' do
    user = FactoryGirl.create(:user)

    visit user_path(user)

    click_link 'Edit Profile'

    fill_in "Last name", with: "Liddle"
    fill_in "Password confirmation", with: user.password_confirmation
    click_button "Confirm changes to User"

    expect(page).to have_content("Your profile has been updated.")
  end
end