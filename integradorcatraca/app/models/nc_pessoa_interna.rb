class NcPessoaInterna < ActiveRecord::Base

  self.table_name = 'ncPessoaInterna'
  self.primary_key = 'IdPessoaInterna'

  def atualizaratributos (p)

    self.IdSupervisorPessoaInterna = 0
    self.IdUnidadePessoaInterna = p.unidadeproffit
    self.UnidadePessoaInterna = p.unidadedi.to_s.upcase
    self.NomePessoaInterna = p.nome.to_s.upcase
    self.ApelidoPessoaInterna = ''
    self.ClassePessoaInterna = p.classe
    self.DocumentoPessoaInterna = "DOC " + p.numusp
    self.MatriculaPessoaInterna = p.numusp
    self.PisPessoaInterna = ''
    self.CPPSNumeroPessoaInterna = ''
    self.CPPSSeriePessoaInterna = ''
    self.CBOPessoaInterna = ''
    self.CargoPessoaInterna = ''
    self.DeptoPessoaInterna = ''
    self.LocalPessoaInterna = ''
    self.FoneOffice1PessoaInterna = ''
    self.FoneOffice2PessoaInterna = ''
    self.EmailOfficePessoaInterna = ''
    self.EnderecoPessoaInterna = ''
    self.NumResPessoaInterna = ''
    self.CEPPessoaInterna = ''
    self.BairroPessoaInterna = ''
    self.CidadePessoaInterna = ''
    self.EstadoPessoaInterna = ''
    self.FoneParticular1PessoaInterna = ''
    self.FoneParticular2PessoaInterna = ''
    self.EmailParticularPessoaInterna = ''
    self.DataNascPessoaInterna = ''
    self.RegHabilitacaoPessoaInterna = ''
    self.CatHabilitacaoPessoaInterna = ''
    self.ValHabilitacaoPessoaInterna = ''
    self.CreditoAcessoPessoaInterna = ''
    self.CentroCustoPessoaInterna = ''
    self.DataInicialExamePessoaInterna = 0
    self.DataFinalExamePessoaInterna = 0
    self.Complemento1PessoaInterna = ''
    self.Complemento2PessoaInterna = ''
    self.Complemento3PessoaInterna = ''
    self.NumeroIDPessoaInterna = p.numuspvia
    self.MascaraIDPessoaInterna = p.identificador
    self.SenhaPessoaInterna = ''
    self.NivelAcesso1PessoaInterna = '102'
    self.NivelAcesso2PessoaInterna = '0'
    self.NivelAcesso3PessoaInterna = '0'
    self.NivelAcesso4PessoaInterna = '0'
    self.NivelAcesso5PessoaInterna = '0'
    self.NivelAcesso6PessoaInterna = '0'
    self.NivelAcesso7PessoaInterna = '0'
    self.NivelAcesso8PessoaInterna = '0'
    self.NivelAcesso9PessoaInterna = '0'
    self.NivelAcesso10PessoaInterna = '0'
    self.BiometriaPessoaInterna = '0'
    self.ValidaBiometriaPessoaInterna = 0
    self.DuploAcessoPessoaInterna = 0
    self.AcessoForaHorarioPessoaInterna = 0
    self.TempoPassagemPessoaInterna = 0
    self.LiberaSaidaCofrePessoaInterna = 0
    self.RecolheCartaoPessoaInterna = 0
    self.ConfirmaAcessoPessoaInterna = 0
    self.AutorizaVisitaPessoaInterna = 1
    self.InfoRecepcaoPessoaInterna = ''
    self.ComputadorOficialPessoaInterna = ''
    self.FaixaHoraExtraPessoaInterna = ''
    self.StatusPessoaInterna = 0
    self.ImagemFotoPessoaInterna = ''
    self.DataCadastro = DateTime.now.strftime("%Y%m%d")

  end

end
