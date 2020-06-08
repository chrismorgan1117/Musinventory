class CreateTableEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
