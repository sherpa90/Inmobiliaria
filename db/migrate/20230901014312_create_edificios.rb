class CreateEdificios < ActiveRecord::Migration[7.0]
  def change
    create_table :edificios do |t|
      t.string :nombre
      t.string :direccion
      t.integer :comuna_id
      t.boolean :piscina
      t.boolean :quincho
      t.boolean :gimnasio
      t.boolean :areas_verdes
      t.boolean :juegos_infantiles
      t.boolean :estacionamiento
      t.boolean :pet_friendly

      t.timestamps
    end
  end
end
