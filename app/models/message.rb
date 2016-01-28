class Message < ActiveRecord::Base
  belongs_to :user, :foreign_key =>"user_id", :class_name =>"User"
  belongs_to :match, :foreign_key =>"match_id", :class_name => "User"
  has_many :users
  has_many :matches
  validates :message, presence:true
end
