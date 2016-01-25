class Answer < ActiveRecord::Base
  belongs_to :personal_question
  belongs_to :user
end
