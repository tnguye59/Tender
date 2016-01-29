class CommentsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => :count
	def chat
		@match_id = User.find(params[:id])
		@messages = Message.where(user_id:current_user.id, match_id: params[:id])
	end

	def count
		Message.create(match_id: params[:match_id], count: params[:count],user_id: current_user.id)
		render :json => { :result => true }
	end
end
