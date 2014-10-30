require 'spec_helper'

feature "Viewing listings" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:listing) { FactoryGirl.create(:listing) }

  before do
    sign_in_as!(user)
    define_permissions!(user, :view, project)
  end

  scenario "Listing all listings" do
    visit '/listings'
    click_link listing.name

    expect(page.currentl_url).to eql(project_url(project))
  end
end