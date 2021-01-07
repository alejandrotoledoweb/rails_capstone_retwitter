class User < ApplicationRecord
  validates :fullname, presence: true, length: { in: 3..20 }
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: true
end
