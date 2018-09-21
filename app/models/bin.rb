class Bin < ActiveRecord::Base
	belongs_to :user
	has_many :loads
end