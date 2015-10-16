class Comment < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.belongs_to :user, index: true
  		t.belongs_to :project, index: true
  		t.string :title
  		t.string :content
  	end
    add_foreign_key :offers, :users
    add_foreign_key :offers, :projects
  end
end
