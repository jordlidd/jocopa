class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :city, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, :uniqueness => { :case_sensitive => false }
  
end
