class CreateNcPessoaInternas < ActiveRecord::Migration
  def change
    create_table :nc_pessoa_internas do |t|

      t.timestamps
    end
  end
end
