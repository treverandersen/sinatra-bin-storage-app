class AddUserIdToBinsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :bins, :user_id, :integer
  end
end
