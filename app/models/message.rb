class Message < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 150 }
end
