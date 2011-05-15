class User < ActiveRecord::Base
	belongs_to :team
	validates_presence_of     :twitter_id, :screen_name, :token, :secret
	validates_numericality_of :twitter_id, :point
	validates_uniqueness_of   :twitter_id, :token, :secret

	def self.create_with_omniauth(auth)
		user = User.new
		user.twitter_id  = auth["uid"]
		user.screen_name = auth["user_info"]["nickname"]
		user.token       = auth["credentials"]["token"]
		user.secret      = auth["credentials"]["secret"]
		user.save!
		return user
	end

end
