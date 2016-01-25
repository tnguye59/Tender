class User < ActiveRecord::Base
  has_secure_password
  has_many :relationships, :class_name =>"Match", :foreign_key => "user_id" 
  has_many :matches, :through => :relationships
  has_many :messages
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :sex, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }


  validates_each :birthday do |record, attr, value|
    record.errors.add attr, 'You need to be over 18 to use this website' if value > (18.years.ago).to_date
  end

	def not_matches
		self.relationships.count == 0 ? User.where("id not in (?)", self.id) : User.where("id not in (?,?)", self.relationships.pluck(:match_id), (self.id))
	end
end
