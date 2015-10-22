class ProjectServices < ActiveRecord::Migration
  def change
  	  	create_table :project_services do |t|
  		t.belongs_to :user
  		t.belongs_to :project 
  	end
  end
end
