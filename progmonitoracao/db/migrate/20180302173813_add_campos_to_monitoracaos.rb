class AddCamposToMonitoracaos < ActiveRecord::Migration
  def change
    add_column :monitoracaos, :laboratorio, :string
  end
end
