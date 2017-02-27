class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :description
      t.references :service, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
