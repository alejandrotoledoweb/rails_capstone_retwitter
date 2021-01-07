class User < ApplicationRecord
  validates :fullname, presence: true, length: { in: 3..20 }
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  VALID_EMAIL_REGEX.freeze = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
