class ComunasController < ApplicationController
  before_action :set_comuna, only: %i[ show edit update destroy ]

  # GET /comunas or /comunas.json
  def index
    @comunas = Comuna.all
  end

  # GET /comunas/1 or /comunas/1.json
  def show
  end

  # GET /comunas/new
  def new
    @comuna = Comuna.new
  end

  # GET /comunas/1/edit
  def edit
  end

  # POST /comunas or /comunas.json
  def create
    @comuna = Comuna.new(comuna_params)

    respond_to do |format|
      if @comuna.save
        format.html { redirect_to comuna_url(@comuna), notice: "Comuna was successfully created." }
        format.json { render :show, status: :created, location: @comuna }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comuna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comunas/1 or /comunas/1.json
  def update
    respond_to do |format|
      if @comuna.update(comuna_params)
        format.html { redirect_to comuna_url(@comuna), notice: "Comuna was successfully updated." }
        format.json { render :show, status: :ok, location: @comuna }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comuna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comunas/1 or /comunas/1.json
  def destroy
    @comuna.destroy

    respond_to do |format|
      format.html { redirect_to comunas_url, notice: "Comuna was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comuna
      @comuna = Comuna.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comuna_params
      params.require(:comuna).permit(:name)
    end
end
