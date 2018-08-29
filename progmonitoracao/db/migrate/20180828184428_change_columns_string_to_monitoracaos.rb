class ChangeColumnsStringToMonitoracaos < ActiveRecord::Migration
  def change
    change_column :monitoracaos, :iniciomes, :string
    change_column :monitoracaos, :inicioano, :string
  end
end
