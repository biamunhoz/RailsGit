class Monitoracao < ActiveRecord::Base

  has_many :dosimetro
  belongs_to :status
  belongs_to :usuario

  validates_presence_of :nome, :email, :cpf, :documentocpf, :datanasc, :descricaouso, message: "Campo obrigatório"

  has_attached_file :documentocpf,
                    :path => ":rails_root/public/system/documentocpf/:id/:style/:basename.:extension",
                    :url => "/system/documentocpf/:id/:style/:basename.:extension"

  validates_attachment :documentocpf,
                       content_type: { content_type: ["application/pdf" , "image/jpeg", "image/gif", "image/png"] }

end
