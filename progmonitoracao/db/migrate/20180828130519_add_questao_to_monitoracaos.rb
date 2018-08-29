class AddQuestaoToMonitoracaos < ActiveRecord::Migration
  def change
    add_column :monitoracaos, :possuidosimetro, :boolean
    add_column :monitoracaos, :coddostemp, :string

    
  end
end
