class Scholarship < ActiveRecord::Base
  belongs_to :cause
  delegate :description, to: :cause
end
