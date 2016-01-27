class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to "/match/#{user.id}"
		else
			flash[:msg] = "Invalid Email/Password Combination"
			redirect_to :back
		end
	end
	
	def destroy
		session.clear
  		redirect_to '/'
  	end
end
