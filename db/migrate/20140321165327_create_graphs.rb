class CreateGraphs < ActiveRecord::Migration
  def change
    create_table :graphs do |t|
      t.string :name
      t.string :post_id

      t.timestamps
    end

    add_index :graphs, :post_id
  end
end
