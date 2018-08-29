class DosimetrosController < ApplicationController
  before_action :set_dosimetro, only: [:show, :edit, :update, :destroy]
  before_filter :autenticado?

  # GET /dosimetros
  # GET /dosimetros.json
  def index
    @dosimetros = Dosimetro.all
  end

  # GET /dosimetros/1
  # GET /dosimetros/1.json
  def show
  end

  def termoinclusao
  end

  # GET /dosimetros/new
  def new
    @dosimetro = Dosimetro.new
  end

  # GET /dosimetros/1/edit
  def edit
  end

  # POST /dosimetros
  # POST /dosimetros.json
  def create
    @dosimetro = Dosimetro.new(dosimetro_params)

    respond_to do |format|
      if @dosimetro.save
        format.html { redirect_to @dosimetro, notice: 'Dosimetro cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @dosimetro }
      else
        format.html { render :new }
        format.json { render json: @dosimetro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dosimetros/1
  # PATCH/PUT /dosimetros/1.json
  def update
    respond_to do |format|
      if @dosimetro.update(dosimetro_params)
        format.html { redirect_to @dosimetro, notice: 'Dosimetro foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @dosimetro }
      else
        format.html { render :edit }
        format.json { render json: @dosimetro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dosimetros/1
  # DELETE /dosimetros/1.json
  def destroy
    @dosimetro.destroy
    respond_to do |format|
      format.html { redirect_to dosimetros_url, notice: 'Dosimetro foi apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dosimetro
      @dosimetro = Dosimetro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dosimetro_params
      params.require(:dosimetro).permit(:nome, :monitoracao_id)
    end
end
