class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :title
      t.string :description
      t.integer :amount_of_donations
      t.integer :goal
      t.integer :funded
      t.integer :limit
      t.text :notification_params
      t.string :status
      t.string :transaction_id
      t.datetime :purchased_at
      t.timestamps null: false
    end
  end
end
