class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :description
      t.integer :user_client
      t.integer :user_professional
      t.integer :status

      t.timestamps
    end
  end
end
