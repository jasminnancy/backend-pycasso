class MessagesController < ApplicationController
    def update
        message = Message.find_by(id: params[:id])
        message.read = true
        if message.save
            render json: message
        end
    end
end
