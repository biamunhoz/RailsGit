class AddOutrafuncToMonitoracaos < ActiveRecord::Migration
  def change
    add_column :monitoracaos, :outrafunc, :string
  end
end
