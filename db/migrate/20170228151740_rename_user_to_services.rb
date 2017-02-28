class RenameUserToServices < ActiveRecord::Migration[5.0]
  def change
    rename_column :services, :user_client, :user_client_id
    rename_column :services, :user_professional, :user_professional_id
  end
end
