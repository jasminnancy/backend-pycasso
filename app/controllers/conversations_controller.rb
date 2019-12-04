class ConversationsController < ApplicationController
    def getConvos
        convos = Conversation.where("first_user_id = ? OR second_user_id = ?", params[:id], params[:id])
        render json: convos, :include => [:messages]
    end
    
    def create
        if Conversation.between(params[:first_user_id], params[:second_user_id]).present?
            conversation = Conversation.between(params[:first_user_id], params[:second_user_id]).first
            message = Message.new(body: params[:body], conversation_id: conversation.id, user_id: params[:first_user_id])
            if message.save
                render json: conversation, :include => [:messages]
            end
        else
            conversation = Conversation.new(conversation_params)
            if conversation.save
                message = Message.new(body: params[:body], conversation_id: conversation.id, user_id: params[:first_user_id])
                if message.save
                    render json: conversation, :include => [:messages]
                end
            end
        end
    end

    private

    def conversation_params
        params.require(:conversation).permit(:first_user_id, :second_user_id, messages_attributes: [:body])
    end
end
