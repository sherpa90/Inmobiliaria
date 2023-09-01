class Departamento < ApplicationRecord
    belongs_to :edificio
    has_many_attached :imagenes

    scope :disponibles, -> { where(estado: 'disponible') }
end
