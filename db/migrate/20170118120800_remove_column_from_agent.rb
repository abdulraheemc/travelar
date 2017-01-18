class RemoveColumnFromAgent < ActiveRecord::Migration
  def change
    remove_column :agents, :mobile_number, :string
  end
end
