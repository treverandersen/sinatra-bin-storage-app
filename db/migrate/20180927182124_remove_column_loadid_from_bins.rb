class RemoveColumnLoadidFromBins < ActiveRecord::Migration[5.2]
  def change
    remove_column :bins, :load_id, :integer
  end
end
