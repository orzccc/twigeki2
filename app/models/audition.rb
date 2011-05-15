class Audition < ActiveRecord::Base
	validates_presence_of :title, :vote_from
end
