class AddActivedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :actived, :boolean, :default => false
  end
end
