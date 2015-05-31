class CreateEventTemplates < ActiveRecord::Migration
  def change
    create_table :event_templates do |t|
      t.string :name

      t.timestamps
    end
  end
end
