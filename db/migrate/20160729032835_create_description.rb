class CreateDescription < ActiveRecord::Migration
  def change
  	create_table :pokemondescription do |t|
    	t.string "pokemon_name"
    	t.string "pokemon_type"
    	t.text "pokemon_description"
    	t.string "photo_url"
  	end
	end
end