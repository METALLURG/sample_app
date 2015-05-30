class CreateActionMember < ActiveRecord::Migration
  def change
    create_table :action_members do |t|
      t.string   :id_action
      t.string   :id_user
      t.string   :date_prepay
      t.string   :prepay
    end
  end
end
