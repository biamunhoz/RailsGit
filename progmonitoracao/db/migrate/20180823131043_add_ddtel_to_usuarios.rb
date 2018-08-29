class AddDdtelToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :ddfixo, :string
    add_column :usuarios, :ddcel, :string
  end
end
