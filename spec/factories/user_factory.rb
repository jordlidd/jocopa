FactoryGirl.define do
  factory :user do
    first_name "Bruce"
    last_name "Wayne"
    email "bruce@gotham.net"
    password "secret"
    password_confirmation "secret"
    city "Gotham"
  end
end