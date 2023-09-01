class EdificiosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_edificio, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, except: [:index, :show]
  include Pagy::Backend

  # GET /edificios or /edificios.json
  def index
    @edificios = Edificio.all
  end

  # GET /edificios/1 or /edificios/1.json
  def show
  end

  # GET /edificios/new
  def new
    @edificio = Edificio.new
  end

  # GET /edificios/1/edit
  def edit
  end

  # POST /edificios or /edificios.json
  def create
    @edificio = Edificio.new(edificio_params)
  
    if @edificio.save
      redirect_to @edificio, notice: 'Edificio was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /edificios/1 or /edificios/1.json
  def update
    if @edificio.update(edificio_params)
      redirect_to @edificio, notice: 'Edificio was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /edificios/1 or /edificios/1.json
  def destroy
    @edificio.destroy
    redirect_to edificios_url, notice: 'Edificio was successfully destroyed.'
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_edificio
    @edificio = Edificio.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def edificio_params
    params.require(:edificio).permit(:nombre, :direccion, :comuna_id, :departamento_id, :piscina, :quincho, :gimnasio, :areas_verdes, :juegos_infantiles, :estacionamiento, :pet_friendly)
  end

  def check_admin
    redirect_to root_path, alert: "No tienes permiso para realizar esta acción" unless current_user.admin?
  end
end
