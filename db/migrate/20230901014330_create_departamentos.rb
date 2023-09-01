class CreateDepartamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :departamentos do |t|
      t.integer :numero
      t.integer :precio
      t.integer :habitaciones
      t.integer :baños
      t.string :estado
      t.string :modalidad
      t.integer :edificio_id

      t.timestamps
    end
  end
end
