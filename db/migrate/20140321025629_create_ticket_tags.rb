class CreateTicketTags < ActiveRecord::Migration
  def change
    create_table :ticket_tags do |t|
      t.integer :ticket_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :ticket_tags, :ticket_id
    add_index :ticket_tags, :tag_id
  end
end
