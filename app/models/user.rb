class User < ApplicationRecord
  validates :user_id, presence: true, uniqueness: true
  validates :password, presence: true

  validates :nickname, length: { maximum: 30 }
  validates :comment, length: { maximum: 100 }
end
