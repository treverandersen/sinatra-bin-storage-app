class AddUserIdToLoadsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :loads, :user_id, :integer
  end
end
