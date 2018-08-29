json.extract! monitoracao, :id, :siglalab, :nome, :datanasc, :sexo, :cpf, :iniciomes, :inicioano, :tipomonitor, :departamento, :coddept, :docente, :emaildocente, :nomeinstituicao, :areaaplicacao, :tiporadiacao, :funcao, :codfuncao, :aplicacaoradiacao, :descricaouso, :local, :email, :created_at, :updated_at
json.url monitoracao_url(monitoracao, format: :json)
