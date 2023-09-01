class Edificio < ApplicationRecord
    belongs_to :comuna
    has_many :departamentos, dependent: :destroy

end
