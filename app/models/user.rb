class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy

  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :fullname, presence: true, length: { in: 3..20 }
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  # rubocop:disable Style/MutableConstant
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # rubocop:enable Style/MutableConstant
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Message.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  # Follows a user and prevent to follow yourself
  def follow(other_user)
    following << other_user unless self == other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end
