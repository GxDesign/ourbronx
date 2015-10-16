class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", small: "150x150>", thumb: "60x60#{}" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
