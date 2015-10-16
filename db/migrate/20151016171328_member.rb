class Member < ActiveRecord::Migration
  def change
  	create_table :members do |t|
  		t.belongs_to :project, index: true
  		t.integer :user_id
  		t.string :role
  		t.text :bio
  		
  		t.timestamps null: false
  	end
  	add_foreign_key :members, :projects
  end
end
