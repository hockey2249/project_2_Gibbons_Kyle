class CreatePokemonads < ActiveRecord::Migration
  def change
  	create_table :pokemonads do |t|
    	t.string "pokemon_name"
    	t.string "photo_url"
    	t.string "address"
  end
end
end
