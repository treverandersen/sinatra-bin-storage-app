class AddColumnBinidToLoads < ActiveRecord::Migration[5.2]
  def change
    add_column :loads, :bin_id, :integer
  end
end
