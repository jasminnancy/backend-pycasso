class CloseFriend < ApplicationRecord
    belongs_to :close_friends, class_name: 'User', foreign_key: 'close_friend_id'
    belongs_to :close_friender, class_name: 'User', foreign_key: 'user_id'
end
