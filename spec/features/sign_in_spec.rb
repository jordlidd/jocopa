require 'spec_helper'

feature 'signing in' do
  scenario 'Signing in via form' do
    user = FactoryGirl.create(:user)

    visit '/'
    click_link 'Log In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Sign in successful.')
    expect(page).to have_title(user.first_name) 
    expect(page).to have_link('Profile',     href: user_path(user)) 
    expect(page).to have_link('Sign out',    href: signout_path) 
    expect(page).to_not have_link('Log in', href: signin_path) 
  end

  

  scenario 'Signing in via form with wrong password' do
    user = FactoryGirl.create(:user)

    visit '/'
    click_link 'Log In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "wrongpw"
    click_button 'Sign In'

    expect(page).to have_content('Sorry. We couldn\'t sign you in.')
  end

end
