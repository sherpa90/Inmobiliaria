class AddDepartamentoToEdificios < ActiveRecord::Migration[7.0]
  def up
    add_reference :edificios, :departamento, foreign_key: true, null: true

    # Asegúrate de que todos los registros existentes tengan un departamento_id válido.
    # Por ejemplo, podrías hacer algo como esto si tienes un departamento con id 1:
    Edificio.update_all(departamento_id: 1)

    change_column_null :edificios, :departamento_id, false
  end

  def down
    remove_reference :edificios, :departamento
  end
end
