class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
 
    def profile
        render json: { user: current_user }, status: :accepted
    end
   
    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
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
