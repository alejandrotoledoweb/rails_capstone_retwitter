class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates :fullname, presence: true, length: { in: 3..20 }
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def feed
    Message.where("user_id = ?", id)
  end

end
