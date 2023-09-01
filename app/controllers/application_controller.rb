class ApplicationController < ActionController::Base
  require 'pagy/extras/bootstrap'
  
  Pagy::DEFAULT[:items] = 6
  include Pagy::Backend
  # Método para verificar si el usuario actual es administrador o vendedor
  def check_admin
    # Si el usuario actual no es administrador ni vendedor, redirige a la página principal
    unless current_user.admin? || current_user.vendedor?
      redirect_to root_path, alert: "No tienes permiso para realizar esta acción"
    end
  end      
end
