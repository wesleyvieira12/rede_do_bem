class AddSliderToImageSliders < ActiveRecord::Migration[5.0]
  def change
    add_reference :image_sliders, :slider, foreign_key: true
  end
end
