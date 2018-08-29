class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.boolean :admin
      t.string :password_digest
      t.string :aut_token
      t.string :senha_reset_token
      t.string :senha_reset_sent_at

      t.timestamps null: false
    end
  end
end
