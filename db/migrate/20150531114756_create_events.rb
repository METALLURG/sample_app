class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, index: true
      t.string :name
      t.string :city
      t.datetime :started_at
      t.datetime :finished_at
      t.decimal :prepay_price
      t.text :content

      t.timestamps
    end
  end
end
