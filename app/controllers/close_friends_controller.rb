class CloseFriendsController < ApplicationController
    def create
        friend = CloseFriend.new(user_id: params['user_id'], close_friend_id: params['close_friend_id'])
        if friend.save
            render json: friend, status: :accepted
        end
    end

    ##custom destroy method
    def remove
        friend = CloseFriend.find_by(user_id: params['user_id'], close_friend_id: params['close_friend_id'])
        id = friend.close_friend_id
        if friend.destroy
            render json: {message: id}
        end
    end
end
