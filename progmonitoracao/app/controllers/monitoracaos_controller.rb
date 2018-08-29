class MonitoracaosController < ApplicationController
  before_action :set_monitoracao, only: [:show, :edit, :update, :destroy, :geraform]
  before_filter :autenticado?

  # GET /monitoracaos
  # GET /monitoracaos.json
  def index

    if session[:admin] == true
      @monitoracaos = Monitoracao.all
    else
      @monitoracaos = Monitoracao.all.where(usuario_id: session[:usuario_id]).where(" estado in ('ALTERACAO', 'INCLUSAO') ")
    end

  end

  # GET /monitoracaos/1
  # GET /monitoracaos/1.json
  def show
  end

  # GET /monitoracaos/new
  def new
    @monitoracao = Monitoracao.new
  end

  # GET /monitoracaos/1/edit
  def edit
  end

  # POST /monitoracaos
  # POST /monitoracaos.json
  def create
    @monitoracao = Monitoracao.new(monitoracao_params)

    @monitoracao.siglalab = "IFUSP"

    if @monitoracao.departamento == 'Fisiologia'

      if @monitoracao.tipomonitor == 2
        @monitoracao.numcnen = 10381470014
      elsif @monitoracao.tipomonitor == 6
        @monitoracao.numcnen = 10381470022
      end
    elsif @monitoracao.departamento == 'Imunologia'
      @monitoracao.numcnen = 10381470030
    end

    @monitoracao.coddept = 1 #calcular (de acordo com o departamento)
    @monitoracao.nomeinstituicao = "ICB-USP"
    @monitoracao.areaaplicacao = "ENSINO E PESQUISA - EP"
    @monitoracao.codfuncao = 1 #calcular (de acordo com o departamento)
    @monitoracao.aplicacaoradiacao = "J"
    @monitoracao.local = "São Paulo ICB/USP"
    @monitoracao.usuario_id = session[:usuario_id]
    @monitoracao.estado = "INCLUSAO"



    respond_to do |format|
      if @monitoracao.save

        if @monitoracao.possuidosimetro == true

          @monitoracao.status_id = 2

          @dosimetro = Dosimetro.where(nome: @monitoracao.coddostemp)

          if @dosimetro.empty?

            @newdosimetro = Dosimetro.new
            @newdosimetro.nome = @monitoracao.coddostemp
            @newdosimetro.monitoracao_id = @monitoracao.id

            @newdosimetro.save!

          else
            @dosexiste = Dosimetro.find_by_nome(@monitoracao.coddostemp)
            @dosexiste.monitoracao_id = @monitoracao.id
            @dosexiste.save!
          end

        else
          @monitoracao.status_id = 1
        end

        @monitoracao.save!


        format.html { redirect_to @monitoracao, notice: 'Inclusão no programa de monitoração foi feito com sucesso.' }
        format.json { render :show, status: :created, location: @monitoracao }
      else
        format.html { render :new }
        format.json { render json: @monitoracao.errors, status: :unprocessable_entity }
      end
    end
  end

  def calculamesano

    @hoje = Date.today

    @mes = @hoje.month
    @ano = @hoje.year

    if @mes == 12
      @mes = 1
      @ano = @ano + 1
    else
      @mes = @mes + 1
    end

  end

  # PATCH/PUT /monitoracaos/1
  # PATCH/PUT /monitoracaos/1.json
  def update

    if @monitoracao.usuario_id == session[:usuario_id]
      @monitoracao.estado = "ALTERACAO"
    end

    respond_to do |format|
      if @monitoracao.update(monitoracao_params)
        format.html { redirect_to @monitoracao, notice: 'Alteração no programa de monitoração foi realizada com sucesso.' }
        format.json { render :show, status: :ok, location: @monitoracao }
      else
        format.html { render :edit }
        format.json { render json: @monitoracao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monitoracaos/1
  # DELETE /monitoracaos/1.json
  def destroy
    #@monitoracao.destroy
    @monitoracao.estado = "EXCLUSAO"
    @monitoracao.dosimetro = nil
    @monitoracao.status_id = 3
    @monitoracao.save!

    respond_to do |format|
      format.html { redirect_to monitoracaos_url, notice: 'Exclusão no programa de monitoração foi realizado com sucesso.' }
      format.json { head :no_content }
    end
  end

  def geraform

    #respond_to do |format|
    #  format.html
    #end

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'geraform.pdf',
               :template => 'geraform.pdf.erb',
               :orientation => 'Landscape',
               :show_as_html => params[:debug].present?,
               :page_size => 'A4',
               :disposition => 'inline',
               footer: { center: '[page]/[topage]' },
               :margin => {
                   top: 10,
                   bottom: 10,
                   left: 6,
                   right: 6
               }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monitoracao
      @monitoracao = Monitoracao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monitoracao_params
      params.require(:monitoracao).permit(:siglalab, :nome, :datanasc, :sexo, :cpf, :iniciomes, :inicioano, :tipomonitor, :departamento, :coddept, :docente, :emaildocente, :nomeinstituicao, :areaaplicacao, :tiporadiacao, :funcao, :codfuncao, :aplicacaoradiacao, :descricaouso, :local, :email, :documentocpf, :numcnen, :dosimetro_id, :status_id, :usuario_id, :estado, :laboratorio, :outrafunc, :coddostemp, :possuidosimetro)
    end
end
