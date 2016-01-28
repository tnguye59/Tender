class PersonalQuestion < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy
  validates :q1, :q2, :q3, presence: true


  def user_answer1 user_id
  	Answer.where(user_id: user_id).pluck(:a1)[0] 
  end 

  def user_answer2 user_id
  	Answer.where(user_id: user_id).pluck(:a2)[0]
  end 

  def user_answer3 user_id
  	Answer.where(user_id: user_id).pluck(:a3)[0]
  end 

end
