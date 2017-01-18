class AddColumnsToAgent < ActiveRecord::Migration
  def change
    add_column :agents, :mobile_number, :integer
  end
end
