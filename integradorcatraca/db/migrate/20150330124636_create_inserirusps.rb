class CreateInserirusps < ActiveRecord::Migration
  def change
    create_table :inserirusps do |t|
      t.string :numusp
      t.string :nome
      t.string :classe
      t.string :unidadedi
      t.string :numuspvia
      t.string :identificador
      t.string :unidadeproffit

      t.timestamps
    end
  end
end
