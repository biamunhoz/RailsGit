class NcPessoaInternaController < ApplicationController

  def limpar

    #limpeza 2014 ok
    #limpeza 2015 ok
    #limpeza 2016 ok

    @ncpi = NcPessoaInterna.find_by_sql("select MatriculaPessoaInterna from ncPessoaInterna where MatriculaPessoaInterna not in (select distinct MascaraIDAcesso from ncPessoaAcessoHistorico) and DataCadastro like '%201612%' ")

    @ncpi.each do |pi|

      matricula = pi.MatriculaPessoaInterna

      @ncidentificador = NcIdentificador.where(" MascaraIdentificador = ? ", matricula)

      @ncidentificador.each do |i|
        i.destroy
      end

      @ncpessoaint = NcPessoaInterna.where(" MatriculaPessoaInterna = ? ", matricula)

      @ncpessoaint.each do |p|
        p.destroy
      end

    end

    respond_to do |format|
      format.html # index.html.erb
    end

  end


  def inserir

    @novos = Inserirusp.all

    @novos.each do |p|

      pinterna = NcPessoaInterna.new

      pinterna.atualizaratributos(p)

      pinterna.save

      @id = pinterna.id

      ident = NcIdentificador.new

      ident.atualizaratributos(p, @id)

      ident.save

    end


    @atuais = Atualizarusp.all

    @atuais.each do |p|

      @identificador = NcIdentificador.where(" MascaraIdentificador = ? ", p.numusp)

      @identificador.each do |i|

        numidentificar = i.NumeroIdentificador

        if numidentificar.to_i < p.numuspvia.to_i

          @pessoainterna = NcPessoaInterna.where(" MatriculaPessoaInterna = ? ", p.numusp )

          @pessoainterna.each do |pi|

            if pi.UnidadePessoaInterna == 'ICB' and pi.ClassePessoaInterna == 'SERVIDOR' and p.nomeunidade != 'ICB'
              #pular só nesse caso

            else

              pi.NumeroIDPessoaInterna = p.numuspvia
              pi.DataCadastro = DateTime.now.strftime("%Y%m%d")
              pi.save

              i.NumeroIdentificador = p.numuspvia
              i.save

            end

          end

        end

      end

    end


    @atuais = Ativarusp.all

    @atuais.each do |p|

      @identificador = NcIdentificador.where(" MascaraIdentificador = ? ", p.MascaraIdentificador)

      @identificador.each do |i|

        i.DataValInicialIdentificador = 0
        i.HoraValInicialIdentificador = 0
        i.DataValFinalIdentificador = 0
        i.HoraValFinalIdentificador = 0
        i.StatusIdentificador = 0

        i.save

      end

      @pessoainterna = NcPessoaInterna.where(" MatriculaPessoaInterna = ? ", p.MascaraIdentificador )

      @pessoainterna.each do |pi|

        pi.NumeroIDPessoaInterna = p.NumeroIdentificador
        pi.StatusPessoaInterna = 0

        pi.save

      end

    end

    @atuais = Desativarusp.all

    dataatual = DateTime.now
    dataproxmes = DateTime.now + 30

    @atuais.each do |p|

      @identificador = NcIdentificador.where(" MascaraIdentificador = ? ", p.MascaraIdentificador)

      @identificador.each do |i|

        if i.StatusIdentificador.to_s == "0" and i.TipoIdentificador.to_s == "1"

          if i.DataValFinalIdentificador.to_s == "0"

            i.DataValInicialIdentificador = dataatual.strftime("%Y%m%d")
            i.HoraValInicialIdentificador = 0
            i.DataValFinalIdentificador = dataproxmes.strftime("%Y%m%d")
            i.HoraValFinalIdentificador = 2359
            i.save

          else

            if dataatual.strftime("%Y%m%d") > i.DataValFinalIdentificador.to_s

              i.DataValInicialIdentificador = 0
              i.HoraValInicialIdentificador = 0
              i.DataValFinalIdentificador = 0
              i.HoraValFinalIdentificador = 0
              i.StatusIdentificador = 1
              i.save

              @pessoainterna = NcPessoaInterna.where(" MatriculaPessoaInterna = ? ", p.MascaraIdentificador )

              @pessoainterna.each do |pi|

                pi.StatusPessoaInterna = 1
                pi.save

              end

            end

          end

        end

      end

    end

    respond_to do |format|
      format.html # index.html.erb
    end

  end


=begin
     select MatriculaPessoaInterna from ncPessoaInterna where MatriculaPessoaInterna not in (select distinct MascaraIDAcesso from ncPessoaAcessoHistorico) and DataCadastro like '%2015%'

    se o resultado dessa query for empty select * from ncPessoaAcessoHistorico where MascaraIDAcesso =

    delete from ncIdentificador where MascaraIdentificador =

    delete from ncPessoaInterna where MatriculaPessoaInterna =
=end

=begin
  def atualizar

    @atuais = Atualizarusp.all

    @atuais.each do |p|

      @identificador = NcIdentificador.where(" MascaraIdentificador = ? ", p.numusp)

      @identificador.each do |i|

        numidentificar = i.NumeroIdentificador

        if numidentificar.to_i < p.numuspvia.to_i

          @pessoainterna = NcPessoaInterna.where(" MatriculaPessoaInterna = ? ", p.numusp )

          @pessoainterna.each do |pi|

            if pi.UnidadePessoaInterna == 'ICB' and pi.ClassePessoaInterna == 'SERVIDOR' and p.nomeunidade != 'ICB'
              #pular só nesse caso

            else

              pi.NumeroIDPessoaInterna = p.numuspvia
              pi.DataCadastro = DateTime.now.strftime("%Y%m%d")
              pi.save

              i.NumeroIdentificador = p.numuspvia
              i.save

            end

          end

        end

      end

    end

    respond_to do |format|
      format.html # index.html.erb
    end

  end

  def ativar

    @atuais = Ativarusp.all

    @atuais.each do |p|

      @identificador = NcIdentificador.where(" MascaraIdentificador = ? ", p.MascaraIdentificador)

      @identificador.each do |i|

        i.DataValInicialIdentificador = 0
        i.HoraValInicialIdentificador = 0
        i.DataValFinalIdentificador = 0
        i.HoraValFinalIdentificador = 0
        i.StatusIdentificador = 0

        i.save

      end

      @pessoainterna = NcPessoaInterna.where(" MatriculaPessoaInterna = ? ", p.MascaraIdentificador )

      @pessoainterna.each do |pi|

        pi.NumeroIDPessoaInterna = p.NumeroIdentificador
        pi.StatusPessoaInterna = 0

        pi.save

      end

    end

    respond_to do |format|
      format.html # index.html.erb
    end

  end

  def desativar

    @atuais = Desativarusp.all

    dataatual = DateTime.now
    dataproxmes = DateTime.now + 30

    @atuais.each do |p|

      @identificador = NcIdentificador.where(" MascaraIdentificador = ? ", p.MascaraIdentificador)

      @identificador.each do |i|

        if i.StatusIdentificador.to_s == "0" and i.TipoIdentificador.to_s == "1"

          if i.DataValFinalIdentificador.to_s == "0"

            i.DataValInicialIdentificador = dataatual.strftime("%Y%m%d")
            i.HoraValInicialIdentificador = 0
            i.DataValFinalIdentificador = dataproxmes.strftime("%Y%m%d")
            i.HoraValFinalIdentificador = 2359
            i.save

          else

            if dataatual.strftime("%Y%m%d") > i.DataValFinalIdentificador.to_s

              i.DataValInicialIdentificador = 0
              i.HoraValInicialIdentificador = 0
              i.DataValFinalIdentificador = 0
              i.HoraValFinalIdentificador = 0
              i.StatusIdentificador = 1
              i.save

              @pessoainterna = NcPessoaInterna.where(" MatriculaPessoaInterna = ? ", p.MascaraIdentificador )

              @pessoainterna.each do |pi|

                pi.StatusPessoaInterna = 1
                pi.save

              end

            end

          end

        end

      end

    end

    respond_to do |format|
      format.html # index.html.erb
    end

  end
=end
end
