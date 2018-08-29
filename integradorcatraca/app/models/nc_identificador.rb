class NcIdentificador < ActiveRecord::Base

  self.table_name = 'ncIdentificador'
  self.primary_key = 'IdIdentificador'

  def atualizaratributos (p, idpinterna)

    self.TipoIdentificador = 1
    self.NumeroIdentificador = p.numuspvia
    self.MascaraIdentificador = p.numusp
    self.DataValInicialIdentificador = 0
    self.HoraValInicialIdentificador = 0
    self.DataValFinalIdentificador = 0
    self.HoraValFinalIdentificador = 0
    self.TipoUsuarioIdentificador = 1
    self.IdUsuarioIdentificador = idpinterna
    self.UsuarioIdentificador = p.nome.to_s.upcase
    self.LiberarSaidaIdentificador = 0
    self.AlarmarIdentificador = 0

  end

end
