class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :registration, index: true
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
