class ConvertTimeToDateInEvents < ActiveRecord::Migration
  def up
    change_column :events, :started_at, :date
    change_column :events, :finished_at, :date
  end

  def down
    change_column :events, :started_at, :datetime
    change_column :events, :finished_at, :datetime
  end
end
