class NcUnidadeController < ApplicationController

  def atualizar

    @unidades = Unidadesusp.all

    @unidades.each do |u|

      uni = NcUnidade.new

      uni.atualizaratributos(u)

      uni.save


    end

  end

end
