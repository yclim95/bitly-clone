class CreateUrls < ActiveRecord::Migration
	def change
	  create_table :urls do|t|
	    t.string :short_url_text
	    t.string :long_url_text
	    t.integer :click_count, default: 0

	    t.timestamp null:false
	  end 
	end
end
