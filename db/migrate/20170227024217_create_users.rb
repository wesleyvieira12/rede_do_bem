class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.references :cities, foreign_key: true
      t.references :categories, foreign_key: true
      t.integer :kind
      t.integer :status

      t.timestamps
    end
  end
end
