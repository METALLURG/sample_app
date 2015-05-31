class AddEventTemplateIdToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :event_template, index: true
  end
end
