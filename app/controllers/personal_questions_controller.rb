class PersonalQuestionsController < ApplicationController
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
     q = PersonalQuestion.find_by(user_id: params[:id])
    if q.update(personal_params)
      redirect_to '/user'
    else
      flash[:errors] = q.errors.full_messages
      redirect_to :back
    end
  end

  def show 
    @user = User.find(params[:id])
    @questions = PersonalQuestion.where(user_id:params[:id])
  end

  def createAnswer
    answer = Answer.new(answer_params)
    if answer.save
      redirect_to "/user/#{answer.user_id}"
    else 
      flash[:errors] = answer.errors.full_messages
      redirect_to :back
    end 
  end

  private
  	def personal_params
  		params.require(:personal_question).permit(:q1,:q2,:q3, :user_id)
  	end

    def answer_params
      params.require(:answer).permit(:user_id, :personal_question_id, :a1, :a2, :a3)
    end
end
