class AddEstadoToMonitoracaos < ActiveRecord::Migration
  def change
    add_column :monitoracaos, :estado, :string
  end
end
