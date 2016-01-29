class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	User.find(session[:user_id]) if session[:user_id]
  end 

  def us_states
    ['AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY']
  end 

  def cities
    ['West Side', 'Central LA', 'South Bay', 'San Gabriel Valley', 'Orange County']
  end 

  def gender
    ['Female', 'Male']
  end 
  helper_method :gender, :current_user, :us_states, :cities

  def require_login
    redirect_to '/' if session[:user_id] == nil
  end

  def require_correct_user
    user = User.find(params[:id])
    redirect_to "/user/#{current_user.id}" if current_user != user
  end


end
