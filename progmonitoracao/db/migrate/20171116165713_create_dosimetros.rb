class CreateDosimetros < ActiveRecord::Migration
  def change
    create_table :dosimetros do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
