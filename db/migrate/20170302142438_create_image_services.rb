class CreateImageServices < ActiveRecord::Migration[5.0]
  def change
    create_table :image_services do |t|

      t.timestamps
    end
  end
end
