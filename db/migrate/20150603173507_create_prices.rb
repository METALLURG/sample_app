class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.references :event, index: true
      t.decimal :price, precision: 8, scale: 2
      t.date :valid_till

      t.timestamps
    end
    add_index :prices, [:event_id, :valid_till], unique: true
  end
end
