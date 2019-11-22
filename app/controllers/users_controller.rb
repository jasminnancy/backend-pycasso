class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        @users = User.all
        render json: @users, :except => [:password_digest], :include => [:statuses, :followers]
    end
 
    def profile
        render json: { user: current_user }, :except => [:password_digest], :include => [:statuses, :followers]
    end
   
    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token({ user_id: @user.id })
            render json: { user: @user, jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end
   
    private
    def user_params
        params.require(:user).permit(
            :username, 
            :email,
            :password, 
            :first_name,
            :last_name,
            :bio, 
            :rating,
            :user_type, 
            :verified
        )
    end
end
