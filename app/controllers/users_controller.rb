class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        @users = User.all
        render json: @users, :except => [:password_digest], 
            :include => [:statuses, :following, :followers, :messages, :sent_messages]
    end
 
    def profile
        render json: { user: current_user }, :except => [:password_digest], 
            :include => [:statuses, :following, :followers, :messages, :sent_messages]
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

    def update
        user = User.find_by(id: params['id'])
        if user.update(user_params)
            render json: { message: 'user successfully updated' }
        else
            render json: { error: 'could not update user'}, status: :not_acceptable
        end
    end

    def destroy
        user = User.find_by(id: params['id'])
        if user.destroy
            render json: { message: 'User successfully destroyed' }
        else
            render json: { message: 'Could not delete user. Please try again.'}
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
