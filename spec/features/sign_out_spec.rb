require 'spec_helper'

feature 'signing out' do

    before do
        user = FactoryGirl.create(:user)

        visit '/'
        click_link 'Log In'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Sign In' 
    end

    scenario 'Signing out after logging in' do
        click_link 'Sign out'

        expect(page).to have_content('You are signed out')
        expect(page).to have_content("Listing listings")
        expect(page).to_not have_link('Profile')
        expect(page).to_not have_link('Sign out')
        expect(page).to have_link('Log In') 
    end
end

  
