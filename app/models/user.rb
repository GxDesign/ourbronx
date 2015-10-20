class User < ActiveRecord::Base
  has_many :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", small: "70x70>", thumb: "35x35#{}" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
