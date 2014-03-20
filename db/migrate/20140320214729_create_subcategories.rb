class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.integer :category_id
      t.references :category, index: true
      t.timestamps
    end
  end
end
