class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.string :title
      t.string :description
      t.integer :goal
      t.integer :funded
      t.integer :limit
      t.timestamps null: false
    end
  end
end
