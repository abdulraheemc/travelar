class RemoveColumnFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :approve, :boolean
  end
end
