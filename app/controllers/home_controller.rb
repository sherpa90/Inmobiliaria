class HomeController < ApplicationController
  def index
    @pagy, @departamentos_disponibles = pagy(Departamento.where(estado: 'disponible'))
  end
  
  
  
end
