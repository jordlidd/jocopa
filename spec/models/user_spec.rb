require 'spec_helper'

describe User do
  
  before do
    @user = User.new(first_name: "Example", last_name: "Example", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }



  describe "passwords" do
    it "needs a password and confirmation to save" do
      u = User.new(first_name: "Foo")

      u.save
      expect(u).to_not be_valid

      u.password = "password"
      u.password_confirmation = ""
      u.save
      expect(u).to_not be_valid

      u.password_confirmation = "password"
      u.save
      expect(u).to_not be_valid
    end

    it "needs password and confirmation to match" do
      u = User.create(
        first_name: "Foo",
        last_name: "Bar",
        email: "foobar@bar.com",
        password: "secret",
        password_confirmation: "secrety")
      expect(u).to_not be_valid
    end
  end

  describe "authentication" do
    let(:user) { User.create(
        first_name: "Foo",
        last_name: "Bar",
        email: "foobar@bar.com",
        password: "secret",
        password_confirmation: "secret" )}

    it "authenticates with a correct password" do
      expect(user.authenticate("secret")).to be
    end

    it "does not authenticate with an incorrect password" do
      expect(user.authenticate("secret2")).to_not be
    end
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end