class CreateAuditions < ActiveRecord::Migration
	def self.up
		create_table :auditions do |t|
			t.string :title, :null => false
			t.datetime :vote_from, :null => false
			t.datetime :vote_until
			t.datetime :published_at
			t.timestamps
		end
	end

	def self.down
		drop_table :auditions
	end
end
