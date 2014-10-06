class User < ActiveRecord::Base
  before_create :create_remember_token
  has_secure_password
  validates :first_name, :last_name, :email, :password_confirmation, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, :uniqueness => { :case_sensitive => false }
  
  has_many :listings, dependent: :destroy

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end

