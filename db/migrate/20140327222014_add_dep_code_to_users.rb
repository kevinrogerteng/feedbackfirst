class AddDepCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :department_code, :string
  end
end
