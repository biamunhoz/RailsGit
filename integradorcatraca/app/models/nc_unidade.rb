class NcUnidade < ActiveRecord::Base

  self.table_name = 'ncUnidade'
  self.primary_key = 'IdUnidade'

  def atualizaratributos (u)

    self.NomeUnidade = u.nomorg

  end

end
