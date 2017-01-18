class AddColumnToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :trip_to, :string
  end
end
