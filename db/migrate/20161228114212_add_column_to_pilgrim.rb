class AddColumnToPilgrim < ActiveRecord::Migration
  def change
    add_column :pilgrims, :passport_image, :string
  end
end
