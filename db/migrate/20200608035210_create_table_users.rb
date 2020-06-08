class CreateTableUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :instrument
      t.string :equipment
      t.string :password_digest
  end
end
