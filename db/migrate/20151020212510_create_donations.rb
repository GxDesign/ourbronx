class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :uuid
      t.integer :amount
      t.belongs_to :user, index: true
      t.belongs_to :cause, index: true
    end
    add_foreign_key :donations, :users
    add_foreign_key :donations, :causes
  end
end
