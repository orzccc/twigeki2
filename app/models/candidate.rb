class Candidate < ActiveRecord::Base
	has_one :audition
	has_one :user

	validates_presence_of :audition_id, :user_id, :title
	validates_numericality_of :audition_id, :user_id, :display_order

end
