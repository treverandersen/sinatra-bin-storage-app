class User < ActiveRecord::Base
	has_many :bins
	has_many :loads
	has_secure_password
	#validates_uniqueness_of :username, scope :user_id
end