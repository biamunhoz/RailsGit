class AddMonitoracaoidToDosimetros < ActiveRecord::Migration
  def change

    change_table :dosimetros do |t|
      t.integer :monitoracao_id , :references => [:monitoracaos, :id]
    end
  end
end
