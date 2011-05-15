class CreateCandidates < ActiveRecord::Migration
	def self.up
		create_table :candidates do |t|
			t.integer :audition_id, :null => false
			t.integer :user_id, :null => false
			t.string :title, :null => false
			t.integer :display_order, :default => 0
			t.timestamps
		end
	end

	def self.down
		drop_table :candidates
	end
end
