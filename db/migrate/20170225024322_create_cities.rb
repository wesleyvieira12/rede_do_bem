class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.references :state, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
