class Match < ActiveRecord::Base
	belongs_to :user, :foreign_key =>"user_id", :class_name =>"User"
	belongs_to :match, :foreign_key =>"match_id", :class_name => "User"
	has_many :messages, dependent: :destroy
end
