class AddFotoToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :foto, :string
  end
end
