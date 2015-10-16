class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :summary
      t.text :mentorship_req
      t.text :resources_req
      t.text :services_req
      t.boolean :published
      t.boolean :approved

      t.timestamps null: false
    end
    add_foreign_key :projects, :users
  end
end
