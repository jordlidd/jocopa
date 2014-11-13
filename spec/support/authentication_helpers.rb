module AuthenticationHelpers


  def sign_in_as!(user)
    visit '/signin'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button 'Sign In'
  end
end

# includes this module into all specs in the spec/features directory
Rspec.configure do |c|
  c.include AuthenticationHelpers, type: :feature
end


module AuthHelpers
  def sign_in(user)
    session[:user_id] = user.id
  end
end

Rspec.configure do |c|
  c.include AuthHelpers, type: :controller
end