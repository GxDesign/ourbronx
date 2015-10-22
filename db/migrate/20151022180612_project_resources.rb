class ProjectResources < ActiveRecord::Migration
  def change
  	  	create_table :project_resources do |t|
  		t.belongs_to :user
  		t.belongs_to :project 
  	end
  end
end
