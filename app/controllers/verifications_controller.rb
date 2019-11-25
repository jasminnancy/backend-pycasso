class VerificationsController < ApplicationController
    def index
        verifications = Verification.all

        render json: verifications
    end
    
    def create
        verification = Verification.new(user_id: params['user_id'])

        if verification.save
            render json: { message: 'Your verification request is currently pending.' }
        else
            render json: { error: "You've already requested verification" }
        end
    end
end
