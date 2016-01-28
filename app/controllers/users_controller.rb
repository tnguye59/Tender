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
    matches = Match.where(user_id:@user.id)
    @match = matches.where.not(thumb: -1).limit(3)

	end

  def thumbup
    match1 = Match.find_by(user_id: params[:id], match_id: params[:match])
    match1.update(thumb: 1)
    redirect_to :back
  end

  def thumbdown
    match1 = Match.find_by(user_id: params[:id], match_id: params[:match])
    match1.update(thumb: -1)
    match2 = Match.find_by(user_id: params[:match], match_id: params[:id])
    match2.update(thumb: -1)
    redirect_to :back
  end

  def match
    user = GeneralQuestion.find_by(user_id:params[:id])
    candidates = User.all 
    candidates.each do |c| 
      if Match.where(match_id: c.id, user_id:params[:id]).exists? && Match.where(match_id: params[:id], user_id:c.id).exists?
      else
        if user.gender == c.sex  && 
          user.max_age > c.age(c.birthday) &&
          user.min_age < c.age(c.birthday) && user.city == c.city 
          match1 = Match.create(user_id: user.user_id, match_id: c.id, thumb:0)
          match2 = Match.create(user_id: c.id, match_id: user.user_id, thumb:0)
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
