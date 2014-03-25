class User < ActiveRecord::Base
  has_many :posts
  validates_uniqueness_of :email

  has_secure_password
  before_save :create_remember_token

  validates :password, confirmation: true, length: {in: 6..20}
  validates :password_confirmation, presence: true
end

private

    def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
    end


