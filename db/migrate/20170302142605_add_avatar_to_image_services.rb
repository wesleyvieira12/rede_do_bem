class AddAvatarToImageServices < ActiveRecord::Migration[5.0]
  def change
    add_column :image_services, :avatar, :string
  end
end
