class CreateAction < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :name
      t.string :description
      t.string :city
      t.string :name_master
      t.string :date_start
      t.string :date_finish
      t.string :prepay
    end
    add_index :actions, :name
    add_index :actions, :name_master
    add_index :actions, :city
  end
end
