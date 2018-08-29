class AddcpfToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :cpf, :string
  end
end
