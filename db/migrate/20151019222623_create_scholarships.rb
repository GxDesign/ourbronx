class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.belongs_to :cause
      t.string :title
      t.integer :amount
      t.integer :amount_of_donors
      t.timestamps null: false
    end
  end
end
