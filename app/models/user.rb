class User < ApplicationRecord
    has_many :follows
    has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
    has_many :followers, through: :follower_relationships, source: :follower
    has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
    has_many :following, through: :following_relationships, source: :following

    has_many :statuses

    validates :username, presence: true, uniqueness: { case_sensitive: false }
    has_secure_password
end
