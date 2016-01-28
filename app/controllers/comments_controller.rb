class CommentsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => :count
	def chat
		@match_id = User.find(params[:id])
		@messages = Message.where(user_id:current_user.id, match_id: params[:id])
	end
	def create
		message = Message.new(message: params[:message][:message], post_id: params[:message][:post_id], match_id: 2, user_id: params[:message][:user_id])
		# message = Message.new(message_params)
	    # if message.save
	    #   redirect_to :back
	    # else 
	    #   flash[:errors] = message.errors.full_messages
	    #   redirect_to :back
	    # end 
	end

	def count
		Message.create(match_id: params[:match_id], count: params[:count])
		render :json => { :result => true }
	end
	# private
	# 	def message_params
	#       params.require(:message).permit(:message, :user_id, :match_id, :post_id)
	#     end
end
