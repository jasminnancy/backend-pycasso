class StatusesController < ApplicationController
    def index
        @statuses = Status.all
        render json: @statuses
    end

    def create
        status = Status.new(status_params)
        if status.save
            render json: status, status: :accepted
        end
    end

    private
    def status_params
        params.require(:status).permit(:user_id, :content, :hearts)
    end
end