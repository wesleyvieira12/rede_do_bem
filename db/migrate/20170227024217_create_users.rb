class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.references :citiy, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :kind
      t.integer :status

      t.timestamps
    end
  end
end
