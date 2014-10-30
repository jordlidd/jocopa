class User < ActiveRecord::Base
  before_create :create_remember_token
  before_save { self.email = email.downcase }
  has_secure_password
  validates :first_name, :last_name, :email, :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX, on: :create }
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

