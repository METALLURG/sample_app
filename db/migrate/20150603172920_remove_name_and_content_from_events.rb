class RemoveNameAndContentFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :name, :string
    remove_column :events, :content, :text
  end
end
