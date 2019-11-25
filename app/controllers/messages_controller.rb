class MessagesController < ApplicationController
    def create
        message = Message.new(message_params)
        
        if message.save
            render json: { data: message, message: 'Message Sent' }
        else
            render json: { message: 'Message could not be sent' }
        end
    end

    def destroy
        message = Message.find_by(id: params['id'])

        if message.destroy
            render json: { message: 'Message deleted' }
        else
            render json: { message: 'Message could not be deleted' }
        end
    end

    private

    def message_params
        params.require(:message).permit(:body, :recipient_id, :sender_id)
    end
end
