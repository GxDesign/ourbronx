class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :linkedin, :string
    add_column :users, :personal_sites, :text
    add_column :users, :type, :string
    add_column :users, :street_num, :integer
    add_column :users, :route, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :country, :string
  end
end
