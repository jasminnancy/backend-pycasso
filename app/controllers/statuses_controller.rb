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

    def update
        status = Status.find_by(id: params[:id])
        status.hearts += 1
        if status.save
            render json: status
        end
    end
    
    def destroy
        status = Status.find_by(id: params[:id])
        if status.destroy
            render json: {message: 'Status deleted'}
        else
            render json: {message: 'Status could not be deleted'}
        end
    end

    private
    def status_params
        params.require(:status).permit(:user_id, :content, :hearts)
    end
end