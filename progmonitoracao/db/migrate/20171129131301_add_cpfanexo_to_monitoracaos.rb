class AddCpfanexoToMonitoracaos < ActiveRecord::Migration
  def change

    change_table :monitoracaos do |t|
      t.attachment :documentocpf
    end

  end
end
