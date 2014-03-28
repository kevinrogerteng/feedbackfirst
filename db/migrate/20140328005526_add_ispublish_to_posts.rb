class AddIspublishToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_publish, :boolean, default: false
  end
end
