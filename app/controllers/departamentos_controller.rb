class DepartamentosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_if_admin_or_vendedor, only: [:index_admin]
  before_action :set_departamento, only: [:show, :edit, :update, :destroy]

  # GET /departamentos or /departamentos.json
  def index
    @departamentos = Departamento.where(estado: 'disponible')
  end

  def index_admin
    @departamentos = Departamento.all
    
  end

  # GET /departamentos/1 or /departamentos/1.json
  def show
    @edificio = @departamento.edificio
  end

  # GET /departamentos/new
  def new
    @departamento = Departamento.new
  end

  # GET /departamentos/1/edit
  def edit
  end

  # POST /departamentos or /departamentos.json
  def create
    @departamento = Departamento.new(departamento_params)

    respond_to do |format|
      if @departamento.save
        format.html { redirect_to departamento_url(@departamento), notice: "Departamento was successfully created." }
        format.json { render :show, status: :created, location: @departamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departamentos/1 or /departamentos/1.json
  def update
    respond_to do |format|
      if @departamento.update(departamento_params)
        format.html { redirect_to departamento_url(@departamento), notice: "Departamento was successfully updated." }
        format.json { render :show, status: :ok, location: @departamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departamentos/1 or /departamentos/1.json
  def destroy
    @departamento.destroy

    respond_to do |format|
      format.html { redirect_to departamentos_url, notice: "Departamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departamento
      @departamento = Departamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def departamento_params
      params.require(:departamento).permit(:numero, :precio, :habitaciones, :baños, :estado, :modalidad, :edificio_id)
    end

    def check_if_admin_or_vendedor
      unless current_user.admin? || current_user.vendedor?
        redirect_to root_path, alert: "No tienes permiso para acceder a esta página"
      end
    end
end
