class AddAddressToPokemon < ActiveRecord::Migration
  def change
  	add_column :pokemons, :address, :string
  end
end
