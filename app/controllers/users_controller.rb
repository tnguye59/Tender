class UsersController < ApplicationController
	def index		
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


	# def login
	# 	session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/user/show')
 #      @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"public_profile")  
 #      puts session.to_s + "<<< session"
 #      respond_to do |format|
 #       format.html {  }
 #    end
	# end
	
  def edit
    @user = User.find(params[:id])
    render "edit"
  end

  def update
    u = User.find(params[:id])
    if u.update(user_params)
      redirect_to "/user/#{u.id}"
    else
      flash[:errors] = u.errors.full_messages
      redirect_to :back
    end
  end

	def show
		# session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/user/show')
  #   if params[:code]
  #      session[:access_token] = session[:oauth].get_access_token(params[:code])
  #   end      
  #   @api = Koala::Facebook::API.new(session[:access_token])
  #   #@graph_data = @api.get_object("/me/statuses", "fields"=>"message")
  #   begin
  #      @profile = @api.get_object("/me")
  #      @friends =  @api.get_object("/me/friends")
  #   end
  #   respond_to do |format|
  #      format.html {   }        
  #   end
    @matched_user = User.find(params[:id]).matches.limit(3).distinct
    @user = User.find(params[:id])
	end

  def match
    user = GeneralQuestion.find_by(user_id:params[:id])
    candidates = User.all 
    candidates.each do |c| 
      if Match.where(match_id: c.id, user_id:params[:id]).exists?
      else
        if user.gender == c.sex  && 
          user.max_age > c.age(c.birthday) &&
          user.min_age < c.age(c.birthday) && user.city == c.city 
          match = Match.create(user_id: user.user_id, match_id: c.id)
        end
      end
    end
    redirect_to "/user/#{user.user_id}"
  end

  def profile
    @user = User.find(params[:id])
    render 'profile'
  end

  private 
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :height, :nationality,:sex, :city, :state, :birthday, :password, :password_confirmation, :avatar)
    end
end
