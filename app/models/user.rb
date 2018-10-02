class User < ActiveRecord::Base
	has_many :bins
	has_many :loads
	has_secure_password
	validates :username, presence: true
	validates :username, uniqueness: true
end