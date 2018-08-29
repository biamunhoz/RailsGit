class AddDosimetroToMonitoracaos < ActiveRecord::Migration
  def change
    change_table :monitoracaos do |t|
      t.integer :dosimetro_id , :references => [:dosimetros, :id]
    end

  end
end
