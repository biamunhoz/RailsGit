class AddCamposToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :telfixo, :string
    add_column :usuarios, :telcelular, :string
  end
end
