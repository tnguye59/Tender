class GeneralQuestion < ActiveRecord::Base
  belongs_to :user

  validates :city, :gender, :max_age, :min_age, presence: true
end
