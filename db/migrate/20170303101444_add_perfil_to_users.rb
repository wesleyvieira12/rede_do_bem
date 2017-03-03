class AddPerfilToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :perfil, :string
  end
end
