require 'spec_helper'

describe ListingsController do
  let(:user) { FactoryGirl.create(:user) }

  context "standard users" do
    before do
      sign_in(user)
    end

    it "cannot access the new action"
      get :new

      expect(response).to redirect_to('/')
      expect