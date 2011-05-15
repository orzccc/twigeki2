class Vote < ActiveRecord::Base
	has_one :candidate
	has_one :user

	validates_presence_of     :candidate_id, :user_id
	validates_numericality_of :candidate_id, :user_id
end
