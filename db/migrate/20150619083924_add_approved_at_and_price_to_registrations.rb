class AddApprovedAtAndPriceToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :approved_at, :datetime
    add_column :registrations, :price, :decimal, precision: 8, scale: 2
  end
end
