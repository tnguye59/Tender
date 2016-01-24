class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			# redirect_to "/events/#{user.id}"
		else
			flash[:errors] = ["Invalid Email/Password Combination"]
			redirect_to '/'
		end
	end
	
	def destroy
		session.clear
  		session[:success] = true
  		redirect_to '/'
  	end
end
