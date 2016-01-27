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

	def create_omni
		auth = request.env["omniauth.auth"]
		user = User.find_by(provider: auth['provider'], uid: auth['uid'])
			session[:omniauth] = auth
		if user == nil || auth['uid'] != user.uid  
			redirect_to "/register/omniauth"
		else
			session[:omniauth] = auth['uid']
			session[:user_id] = user.id
			redirect_to "/user/#{user.id}"
		end
	end
	
	def destroy
		session[:user_id] = nil
		session[:omniauth] = nil
  		session[:success] = true
  		redirect_to '/'
  	end
end
