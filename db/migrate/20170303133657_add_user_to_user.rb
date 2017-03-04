class AddUserToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :professional_id, :integer
  end
end
