class AddLoadIdToBinsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :bins, :load_id, :integer
  end
end
