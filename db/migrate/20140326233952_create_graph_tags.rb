class CreateGraphTags < ActiveRecord::Migration
  def change
    create_table :graph_tags do |t|
      t.integer :tag_id
      t.integer :graph_id

      t.timestamps
    end
    add_index :graph_tags, :tag_id
    add_index :graph_tags, :graph_id
  end
end
