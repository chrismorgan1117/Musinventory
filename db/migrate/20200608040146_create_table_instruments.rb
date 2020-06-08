class CreateTableInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
