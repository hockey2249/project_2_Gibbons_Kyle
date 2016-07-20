class Pokemon < ActiveRecord::Migration
  def change
  	create_table :pokemons do |t|
	  	t.string   "name"
	    t.string   "photo_url"
	    t.string   "website"
	    t.string   "phone_number"
	    t.datetime "created_at"
	    t.datetime "updated_at"
  end
end
end


