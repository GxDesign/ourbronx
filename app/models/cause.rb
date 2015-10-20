class Cause < ActiveRecord::Base
  has_many :scholarships
  def amount_funded
    self.funded/100
  end
  def goal_amount
    self.goal/100
  end
end
