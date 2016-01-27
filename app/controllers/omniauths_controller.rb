class OmniauthsController < ApplicationController
	def register
	end

	def create
		user = User.new(user_params)
	    if user.save
	      session[:user_id] = user.id
	      redirect_to '/personal'
	    else 
	      flash[:errors] = user.errors.full_messages
	      redirect_to :back
	    end 
	end

	private 
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :height, :nationality,:sex, :city, :state, :birthday, :password, :password_confirmation, :avatar, :uid, :provider)
    end
end
