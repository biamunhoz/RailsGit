class Usuario < ActiveRecord::Base

  has_many :monitoracaos

  validates_presence_of :nome, :email, :cpf, :telfixo,  message: "Campo obrigatório"
  validates_uniqueness_of :cpf, message: "Só é possível criar um cadastro por vez"
  validates_uniqueness_of :email, message: "Este e-mail já foi cadastrado anteriormente"

  has_secure_password

end
