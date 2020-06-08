class CreateTableCheckLists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.string :name
      t.string :equipment
      t.int :user_id
    end
  end
end
