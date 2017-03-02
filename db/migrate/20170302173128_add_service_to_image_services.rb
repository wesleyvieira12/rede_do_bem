class AddServiceToImageServices < ActiveRecord::Migration[5.0]
  def change
    add_reference :image_services, :service, foreign_key: true
  end
end
