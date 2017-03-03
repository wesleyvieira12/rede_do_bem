class AddReportToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :report, :boolean
  end
end
