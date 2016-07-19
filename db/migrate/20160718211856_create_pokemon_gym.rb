class CreatePokemonGym < ActiveRecord::Migration
  def change
  	create_table :pokemon_gyms do |t| #t stands for table
      t.string :name 
      t.string :photo_url 
      t.string :website 
      t.string :phone_number
      t.timestamps null:true 
  end
end
end
