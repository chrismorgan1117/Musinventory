class DropTableInstruments < ActiveRecord::Migration
  def change
    drop_table :instruments
  end
end
