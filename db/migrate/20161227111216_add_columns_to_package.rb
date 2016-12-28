class AddColumnsToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :starting_city, :string
    add_column :packages, :journey_date, :date
    add_column :packages, :ticket_no, :integer
  end
end
