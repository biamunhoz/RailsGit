class RegistrounicoController < ApplicationController

  def verparametros

    respond_to do |format|
      format.html # ver_dia.html.erb
    end

  end

  def importarregistro

    @numusp = params[:numusp]
    @numuspvia = @numusp + params[:via]

    @result =  NcPessoaInterna.where(" MatriculaPessoaInterna = ? ", @numusp)

    #registro novo
    if @result.empty?

      @novo = Inserirusp.where(" numusp = ? ", @numusp)

      @novo.each do |p|

        pinterna = NcPessoaInterna.new

        pinterna.atualizaratributos(p)

        pinterna.save

        @id = pinterna.id

        ident = NcIdentificador.new

        ident.atualizaratributos(p, @id)

        ident.save

      end

    else

      @atuais = Atualizarusp.where(" numusp = ? ", @numusp)

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

    end

    respond_to do |format|
      format.html
    end

  end

end
