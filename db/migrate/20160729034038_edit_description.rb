class EditDescription < ActiveRecord::Migration
  def change
  	drop_table :pokemondescription
  	create_table :pokemondescriptions do |t|
    	t.string "pokemon_name"
    	t.string "pokemon_type"
    	t.text "pokemon_description"
    	t.string "photo_url"
  	end
  end
end
