class CreateLoads < ActiveRecord::Migration[5.2]
  def change
    create_table :loads do |t|
      t.string :driver_name
      t.integer :load_in_weight
      t.integer :load_out_weight
    end 
  end
end
