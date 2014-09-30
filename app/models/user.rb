class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, :password_confirmation, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, :uniqueness => { :case_sensitive => false }
  
  has_many :listings, dependent: :destroy


end
