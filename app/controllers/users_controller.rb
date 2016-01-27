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
    @questions = PersonalQuestion.where(user_id:params[:id])
    question_id = @questions.pluck(:id)
    # @answers = Answer.all
    @answers = Answer.where(personal_question_id: question_id)
    @user = User.find(params[:id])
    @matched_user = User.find(params[:id]).matches.limit(3).distinct
    @match = Match.where(user_id:params[:id]).limit(3)

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
