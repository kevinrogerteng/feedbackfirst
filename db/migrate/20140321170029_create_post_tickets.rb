class CreatePostTickets < ActiveRecord::Migration
  def change
    create_table :post_tickets do |t|
      t.integer :post_id
      t.integer :ticket_id

      t.timestamps
    end
    add_index :post_tickets, :ticket_id
    add_index :post_tickets, :post_id
  end
end
