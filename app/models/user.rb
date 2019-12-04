class User < ApplicationRecord
    has_many :follows
    has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
    has_many :followers, through: :follower_relationships, source: :follower
    has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
    has_many :following, through: :following_relationships, source: :following

    has_many :reviews, class_name: "Review", foreign_key: "reviewed_id"
    has_many :sent_reviews, class_name: "Review", foreign_key: "user_id"

    has_many :close_friends, class_name: 'CloseFriend', foreign_key: 'user_id'
    has_many :close_friended, class_name: 'CloseFriend', foreign_key: 'close_friend_id'

    has_many :statuses
    has_one :verification
    has_many :photos

    validates :username, presence: true, uniqueness: { case_sensitive: false }
    has_secure_password
end
