class CreateNcIdentificadors < ActiveRecord::Migration
  def change
    create_table :nc_identificadors do |t|

      t.timestamps
    end
  end
end
