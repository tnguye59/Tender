class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to "/user/#{user.id}"
		else
			flash[:msg] = "Invalid Email/Password Combination"
			redirect_to :back
		end
	end
	
	def destroy
		session[:user_id] = nil
  		session[:success] = true
  		redirect_to '/'
  	end
end
