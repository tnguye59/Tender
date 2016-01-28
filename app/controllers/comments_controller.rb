class CommentsController < ApplicationController
	def chat
		@match_id = User.find(params[:id])
		@messages = Message.where(user_id:current_user.id, match_id: params[:id])
	end
	def create
		message = Message.new(message: params[:message][:message], post_id: params[:message][:post_id], match_id: 2, user_id: params[:message][:user_id])
		# message = Message.new(message_params)
	    if message.save
	      redirect_to :back
	    else 
	      flash[:errors] = message.errors.full_messages
	      redirect_to :back
	    end 
	end

	private
		def message_params
	      params.require(:message).permit(:message, :user_id, :match_id, :post_id)
	    end
end
