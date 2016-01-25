class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :match
  validates :message, presence:true
end
