class Supporter < ActiveRecord::Base
	has_one :team
	has_one :user

	validates_presence_of :team_id, :user_id
	validates_numericality_of :team_id, :user_id
end
