class PersonalQuestion < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  validates :q1, :q2, :q3, presence: true
end
