class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.string :workflow_state

      t.timestamps
    end
    add_index :registrations, [:user_id, :event_id], unique: true
  end
end
