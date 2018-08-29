class AddColumsToMonitoracaos < ActiveRecord::Migration

  def change
    add_column :monitoracaos, :status_id, :integer
    add_column :monitoracaos, :usuario_id, :integer
  end

end
