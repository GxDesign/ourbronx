class ProjectMentors < ActiveRecord::Migration
  def change
  	create_table :project_mentors do |t|
  		t.belongs_to :user
  		t.belongs_to :project 
  	end
  end
end
