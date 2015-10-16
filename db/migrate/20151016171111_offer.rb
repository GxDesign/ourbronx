class Offer < ActiveRecord::Migration
  def change
  	create_table :offers do |t|
  		t.belongs_to :user, index: true
  		t.belongs_to :project, index: true
  		t.string :title
  		t.text :content

  		t.timestamps null: false
  	end
    add_foreign_key :offers, :users
    add_foreign_key :offers, :projects
  end
end
