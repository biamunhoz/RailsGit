class CreateMonitoracaos < ActiveRecord::Migration
  def change
    create_table :monitoracaos do |t|
      t.string :siglalab
      t.string :nome
      t.date :datanasc
      t.string :sexo
      t.string :cpf
      t.integer :iniciomes
      t.integer :inicioano
      t.integer :tipomonitor
      t.string :departamento
      t.string :coddept
      t.string :docente
      t.string :emaildocente
      t.string :nomeinstituicao
      t.string :areaaplicacao
      t.string :tiporadiacao
      t.string :funcao
      t.string :codfuncao
      t.string :aplicacaoradiacao
      t.text :descricaouso
      t.string :local
      t.string :email

      t.timestamps null: false
    end
  end
end
