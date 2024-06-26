class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX, message: 'must be a valid email address' }
  has_secure_password
end
