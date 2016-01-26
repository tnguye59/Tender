class GeneralQuestionsController < ApplicationController
  def new
  end

  def create
  	general = GeneralQuestion.new(general_params)
  	if general.save
  	   redirect_to "/match/#{general.user_id}"
  	else 
  		flash[:errors] = general.errors.full_messages
  	end 
  end

  private
  	def general_params
  		params.require(:general_question).permit(:city, :gender, :max_age, :min_age,:user_id) 
  	end
end
