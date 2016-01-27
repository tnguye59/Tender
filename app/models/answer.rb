class Answer < ActiveRecord::Base
  belongs_to :personal_question
  belongs_to :user

  # def answer user_id personal_question_id 
  # 	Answer.where(user_id: user_id, personal_question_id: personal_question_id)
  # end 
end
