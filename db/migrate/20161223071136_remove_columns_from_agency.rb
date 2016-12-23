class RemoveColumnsFromAgency < ActiveRecord::Migration
  def change
    remove_column :agencies, :User_id, :integer
  end
end
