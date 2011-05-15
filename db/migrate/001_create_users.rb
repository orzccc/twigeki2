class CreateUsers < ActiveRecord::Migration
	def self.up
		create_table :users do |t|
			t.integer :twitter_id, :unique => true, :null => false
			t.string :screen_name
			t.string :token, :null => false
			t.string :secret, :null => false
			t.integer :team_id
			t.integer :point, :null => false, :default => 0
			t.boolean :is_admin, :null => false, :default => false
			t.integer :invited_by
			t.timestamps
		end
	end

	def self.down
		drop_table :users
	end
end
