class User < ActiveRecord::Base
  has_secure_password
  has_many :GeneralQuestions, dependent: :destroy
  has_many :relationships, :class_name =>"Match", :foreign_key => "user_id" 
  has_many :matches, :through => :relationships
  has_many :messages, dependent: :destroy
  has_many :PersonalQuestions, dependent: :destroy
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :sex, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  # validates :birthday, presence: true

  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  validates_each :birthday do |record, attr, value|
    if value == nil
      record.errors.add attr, 'cannot be blank'
    elsif value > (18.years.ago).to_date 
      record.errors.add attr, 'has to be over 18 to use this site'
    end
  end

	def not_matches
		self.relationships.count == 0 ? User.where("id not in (?)", self.id) : User.where("id not in (?,?)", self.relationships.pluck(:match_id), (self.id))
	end

  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
