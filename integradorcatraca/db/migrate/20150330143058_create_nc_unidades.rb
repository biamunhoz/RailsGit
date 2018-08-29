class CreateNcUnidades < ActiveRecord::Migration
  def change
    create_table :nc_unidades do |t|

      t.timestamps
    end
  end
end
