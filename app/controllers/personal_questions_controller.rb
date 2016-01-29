class PersonalQuestionsController < ApplicationController
  before_action :require_correct_user, only: [:edit]
  before_action :require_login
  def new
  end

  def create
  	question = PersonalQuestion.new(personal_params)
  	if question.save 
  		redirect_to '/general'
  	else 
  		flash[:errors] = question.errors.full_messages
  		redirect_to :back
  	end 
  end

  def edit
    @question = PersonalQuestion.find_by(user_id: params[:id])
    render 'edit'
  end

  def update
    q = PersonalQuestion.find(params[:id]).destroy
    new_question = PersonalQuestion.new(personal_params) 
    if new_question.save
      redirect_to "/user/#{new_question.user_id}"
    else
      flash[:errors] = new_question.errors.full_messages
      redirect_to :back
    end
  end


  def show 
    @user = User.find(params[:id])
    @questions = PersonalQuestion.where(user_id:params[:id])
  end

  def createAnswer
    if Answer.where(personal_question_id:params[:personal_question_id],user_id:params[:user_id]).exists?
      flash[:answered] = "You already answered"
      redirect_to "/user/#{current_user.id}"
    else
      Answer.create(user_id: params[:user_id], personal_question_id: params[:personal_question_id], a1: params[:a1], a2: params[:a2], a3: params[:a3])
        redirect_to "/user/#{current_user.id}"
    end 
  end

  private
  	def personal_params
  		params.require(:personal_question).permit(:q1,:q2,:q3, :user_id)
  	end
end
