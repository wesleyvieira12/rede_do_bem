class CreateSobres < ActiveRecord::Migration[5.0]
  def change
    create_table :sobres do |t|
      t.text :description

      t.timestamps
    end
  end
end
