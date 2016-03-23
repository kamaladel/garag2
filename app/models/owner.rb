class Owner < ActiveRecord::Base
	has_many :cars
	has_many :visits
	accepts_nested_attributes_for :visits


end
