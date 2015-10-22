class Project < ActiveRecord::Base
  belongs_to :user
  has_many :project_mentors
  has_many :project_resources
  has_many :mentors, through: :project_mentors, foreign_key: "user_id"
  has_many :resources, through: :project_resources, foreign_key: "user_id"
  has_attached_file :image, styles: { medium: "300x300>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
