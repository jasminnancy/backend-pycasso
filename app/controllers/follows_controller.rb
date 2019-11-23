class FollowsController < ApplicationController
    def create
        follow = Follow.new(user_id: params['user_id'], following_id: params['following_id'])
        if follow.save
            render json: follow, status: :accepted
        end
    end

    ##custom destroy method
    def removeFollow
        follow = Follow.find_by(user_id: params['user_id'], following_id: params['following_id'])
        id = follow.following_id
        if follow.destroy
            render json: {message: id}
        end
    end
end