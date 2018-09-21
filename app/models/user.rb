class User < ActiveRecord::Base
	has_many :bins
	has_many :loads
end