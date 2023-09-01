class HomeController < ApplicationController
  def index
    @departamentos_disponibles = Departamento.where(estado: 'disponible')
  end
  
  
end
