class AddContentToEventTemplates < ActiveRecord::Migration
  def change
    add_column :event_templates, :content, :text
  end
end
