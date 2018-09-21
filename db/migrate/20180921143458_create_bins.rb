class CreateBins < ActiveRecord::Migration[5.2]
  def change
    create_table :bins do |t|
      t.text :name
      t.integer :bushel_capacity
      t.integer :per_cent_full
    end
  end
end
