class AddDestaqueToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :destaque, :boolean, :default => false
  end
end
