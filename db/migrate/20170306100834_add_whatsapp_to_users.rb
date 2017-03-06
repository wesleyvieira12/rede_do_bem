class AddWhatsappToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :whatsapp, :string
  end
end
