class Answer < ActiveRecord::Base
  belongs_to :personal_question
  belongs_to :user

  # def user_answer user_id
  # 	Self.where(user_id: user_id).pluck(:a1).to_s
  # end 
end
