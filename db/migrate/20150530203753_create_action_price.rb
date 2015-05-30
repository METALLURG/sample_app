class CreateActionPrice < ActiveRecord::Migration
  def change
    create_table :action_prices do |t|
      t.string :id_name
      t.string :date
      t.string :cost
    end
  end
end
