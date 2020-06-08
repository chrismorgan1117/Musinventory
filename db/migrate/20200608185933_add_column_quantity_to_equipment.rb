class AddColumnQuantityToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :quantity, :int
  end
end
