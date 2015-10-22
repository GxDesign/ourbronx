class User < ActiveRecord::Base
  has_many :projects
  has_many :donations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", small: "70x70>", thumb: "35x35#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


  def full_name
  	"#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end


end
