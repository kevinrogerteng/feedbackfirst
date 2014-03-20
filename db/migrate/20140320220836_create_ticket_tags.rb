class CreateTicketTags < ActiveRecord::Migration
  def change
    create_table :tickettags do |t|
      t.integer :ticket_id
      t.integer :tag_id
      t.references :ticket, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
