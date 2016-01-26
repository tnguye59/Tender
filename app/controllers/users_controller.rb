class UsersController < ApplicationController
	def index		
	end

  def create 
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else 
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end 
  end 

	def login
		session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/user')
      @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"public_profile")  
      puts session.to_s + "<<< session"
      respond_to do |format|
       format.html {  }
    end
	end
	
	def register
	end

	def show
		session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/user')
    if params[:code]
       session[:access_token] = session[:oauth].get_access_token(params[:code])
    end      
    @api = Koala::Facebook::API.new(session[:access_token])
    #@graph_data = @api.get_object("/me/statuses", "fields"=>"message")
    begin
       @profile = @api.get_object("/me")
       @friends =  @api.get_object("/me/friends")
    end
    respond_to do |format|
       format.html {   }        
    end
	end

  private 
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :height, :nationality,:sex, :city, :state, :birthday, :password, :password_confirmation)
    end
end
