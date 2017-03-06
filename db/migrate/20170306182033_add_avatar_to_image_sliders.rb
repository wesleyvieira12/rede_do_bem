class AddAvatarToImageSliders < ActiveRecord::Migration[5.0]
  def change
    add_column :image_sliders, :figure, :string
  end
end
