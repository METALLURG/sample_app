class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :surname,    :string
    add_column :users, :patronymic, :string
    add_column :users, :gender,     :string
    add_column :users, :birthday,   :string
    add_column :users, :country,    :string
    add_column :users, :region,     :string
    add_column :users, :city,       :string
    add_column :users, :mobtel,     :string
    add_column :users, :skype,      :string
    add_column :users, :vk,         :string
    add_column :users, :comment,    :string
  end
end
