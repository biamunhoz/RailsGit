class AddNumcnentoMonitoracaos < ActiveRecord::Migration

  def change
    add_column :monitoracaos, :numcnen, :string
  end

end
