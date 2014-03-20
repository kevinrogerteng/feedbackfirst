class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :user
      t.text :content
      t.string :browser
      t.integer :category_id
      t.integer :subcategory_id
      t.references :category, index: true
      t.references :subcategory, index: true
      t.timestamps
    end
  end
end
