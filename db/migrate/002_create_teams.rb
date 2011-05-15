class CreateTeams < ActiveRecord::Migration
	def self.up
		create_table :teams do |t|
			t.string :title, :null => false
			t.timestamps
		end
	end

	def self.down
		drop_table :teams
	end
end
